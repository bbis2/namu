package com.forest.namu.controller;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Alarm;
import com.forest.namu.domain.Auction;
import com.forest.namu.domain.AuctionBoard;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.AlarmService;
import com.forest.namu.service.AuctionBoardService;
import com.forest.namu.service.AuctionService;
import com.forest.namu.service.PointService;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	
	@Autowired
	private AuctionBoardService bService;
	
	@Autowired
	private AuctionService service;
	
	@Autowired
	private PointService pointService;	

	@Autowired
	private AlarmService alarmService;	
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int cnum, 
			@RequestParam(defaultValue = "") String town , 
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		if(req.getMethod().equals("GET")) {
			town = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd", kwd);
		map.put("cnum", cnum);
		map.put("town", town);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		// 리스트
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		
		service.updateEndState();
		
		List<Auction> list = service.listAuction(map);
		List<Auction> listCategory = service.listCategory();
		
		
		String query = "town=" + town;
		String cp = req.getContextPath();
		String listUrl;
		String articleUrl;
		if(kwd.length() != 0) {
			query += "&kwd=" +
					URLEncoder.encode(kwd, "utf-8");
		}
		if(cnum != 0) {
			query += "&cnum=" + cnum;
		}
		
		listUrl = cp + "/auction/list";
		articleUrl = cp + "/auction/article?page=" + current_page;
		if(query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);		
		
		model.addAttribute("list", list);
		model.addAttribute("kwd", kwd);
		model.addAttribute("cnum", cnum);
		model.addAttribute("town", town);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		model.addAttribute("listCategory", listCategory);
		
		return ".auction.list";
	}
	
	@GetMapping("write")
	public String wrtieFrom(Model model) throws Exception {
		
		model.addAttribute("mode", "write");
		
		return ".auction.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Auction dto, HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "auctionPhoto";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertAuction(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/auction/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long aNum,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		Auction dto = service.findById(aNum);
		if(dto == null) {
			return "redirect:/auction/list";
		}
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		long userPoint = 0;
		try {
			userPoint = pointService.selectPoint(info.getUserId());		
		} catch (Exception e) {
		}
		
		// 최고 입찰가
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aNum", aNum);
		Auction maxAuction = service.findByMaxBid(map);
		if(maxAuction != null) {
			dto.setBid(maxAuction.getBid());
		}
		
		// 로그인 유저의 입찰가
		map.put("userId", info.getUserId());
		Auction userAuction = service.findByUserBid(map);
		
		List<Auction> listFile = service.listAuctionFile(aNum);
		dto.setUploadFile(dto.getImageFile());
		listFile.add(0, dto);
		
		service.updateHitCount(aNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("kwd", kwd);
		model.addAttribute("userPoint", userPoint);
		model.addAttribute("maxAuction", maxAuction);
		model.addAttribute("userAuction", userAuction);
		model.addAttribute("listFile", listFile);

		return ".auction.article";
	}
	
	// 유저의 포인트 가져오기
	@ResponseBody
	@PostMapping("userPoint")
	public Map<String, Object> userPoint(HttpSession session) {
		Map<String, Object> model = new HashMap<String, Object>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		long userPoint = 0;
		try {
			userPoint = pointService.selectPoint(info.getUserId());		
		} catch (Exception e) {
		}
		
		model.put("userPoint", userPoint);

		return model;
	}
	
	// 경매 참여
	@ResponseBody
	@PostMapping("auctionAccept")
	public Map<String, Object> auctionAccept(
			@RequestParam long aNum,
			@RequestParam long bid,
			HttpSession session) {
		
		Map<String, Object> model = new HashMap<String, Object>();
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		Auction auction = service.findById(aNum);
		if(auction == null || auction.getState() != 0 || auction.getSoldId() != null) {
			model.put("state", "endAction"); // 경매종료 
			return model;
		}
		
		// 참여자 포인트 가져오기
		long userPoint = 0;
		try {
			userPoint = pointService.selectPoint(info.getUserId());		
		} catch (Exception e) {
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("aNum", aNum);
		
		// 현재 경매 최고가 
		Auction maxAuction = service.findByMaxBid(map);
		if(maxAuction != null && bid <= maxAuction.getBid()) { // 최고가가 아님
			model.put("state", "noMaxPoint");
			return model;
		}
		
		try {
			long point = userPoint;
			long pbid = 0;
			if(maxAuction != null && maxAuction.getUserId().equals(info.getUserId())) {
				point += maxAuction.getBid();
				pbid = maxAuction.getBid();
			}
			if(bid > point) {
				model.put("state", "lockPoint"); // 잔액부족
				return model;
			}
			map.put("userPoint", userPoint);
			map.put("bid", bid);
			map.put("pbid", pbid);
			map.put("maxAuction", maxAuction);
			
			// 입찰 저장
			service.insertBid(map);
			
			userPoint = pointService.selectPoint(info.getUserId());
			
			model.put("userPoint", userPoint);
			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
		}

		return model;
	}
	
	@GetMapping("qnaList")
	public String qnaList(@RequestParam long aNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session,
			Model model) throws Exception {
		
		// 문의 가져오기
		int size = 9;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("aNum", aNum);
		
		dataCount = bService.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<AuctionBoard> qnalist = bService.listQuestion(map);
		
		Auction dto = (Auction)service.findById(aNum); 

		String paging = myUtil.pagingMethod(current_page, total_page, "listQna");
		
		model.addAttribute("qnalist", qnalist);
		model.addAttribute("dto", dto.getUserId());

		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("paging", paging);		

		return "auction/qnaList";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long aNum,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Auction dto = service.findById(aNum);
		if(dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/auction/list";
		}
		
		List<Auction> listFile = service.listAuctionFile(aNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("listFile", listFile);
		
		return ".auction.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(HttpSession session, Auction dto) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "auctionPhoto";
		
		service.updateAuction(dto, pathname);
		
		return "redirect:/auction/list";
		
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam long aNum,
			@RequestParam String imageFile,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "auctionPhoto" + File.separator + imageFile;

		service.deleteAuction(aNum, pathname);
		
		return "redirect:/auction/list";
	}
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, 
			@RequestParam String filename,
			HttpSession session) throws Exception {

		String state = "true";
		try {
				
			service.deleteAuctionFile(fileNum);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("insertLike")
	@ResponseBody
	public Map<String, Object> usedLike(@RequestParam int aNum, 
	                                    @RequestParam boolean userLiked, HttpSession session) {

	    String state = "true";
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("aNum", aNum);
	    map.put("userId", info.getUserId());
	    
	    try {
	        if (userLiked) {
	        	service.insertAuctionLike(map);
	        } else {
	            service.deleteAuctionLike(map);
	        }
	    } catch (DuplicateKeyException e) {
	        state = "liked";
	    } catch (Exception e) {
	        state = "false";
	    }

	    Map<String, Object> model = new HashMap<String, Object>();
	    model.put("state", state);
	    
	    return model;
	}
	
	// 경매자 - 경매취소
	@PostMapping("auctionCancel")
	@ResponseBody
	public Map<String, Object> auctionCancel(@RequestParam Map<String, Object> paramMap,
			HttpSession session){
	    Map<String, Object> model = new HashMap<String, Object>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	    	paramMap.put("state", 2);
	    	paramMap.put("soldId", "");
	    	paramMap.put("userId", info.getUserId());
			service.updateAuctionState(paramMap);
			model.put("state", "true");
		} catch (Exception e) {
			model.put("state", "false");
			e.printStackTrace();
		}
	
	    return model;
	}
	
	// 경매자 - 낙찰완료
	@PostMapping("auctionOk")
	@ResponseBody
	public Map<String, Object> auctionOk(@RequestParam Map<String, Object> paramMap,
			HttpSession session, HttpServletRequest req){
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> model = new HashMap<String, Object>();
	
	    try {
	    	paramMap.put("state", 3);
	    	paramMap.put("soldId", info.getUserId());
	    	paramMap.put("apply", 1);
	    	
	    	Auction dto = service.findByMaxBid(paramMap);
	    	paramMap.put("bidNum", dto.getBid());
	    	
	    	long aNum = Long.parseLong(paramMap.get("aNum").toString());
	    	
	    	Auction dto2 = service.findById(aNum);
	    	
	    	
			service.updateAuctionState(paramMap);
	    	service.updateBiddetailsApply(paramMap);
	    	
	    	// 주소
			String cp = req.getContextPath();
			String articleUrl;
			
			articleUrl = cp + "/auction/article?aNum=" + aNum;
	    	
			// 내용
	    	String s = dto.getNickName() + "님 축하드립니다! 🌳" + dto.getSubject() + "🌳 경매 상품에 낙찰되었습니다.";
	    	s += "<a href='"+articleUrl+"'>상품바로가기</a>";
	    	
	    	// 낙찰자에게 알림
	    	Alarm alarm = new Alarm();
	    	alarm.setCnum(1);
	    	alarm.setContent(s);
	    	alarm.setUserId(dto.getUserId());
	    	alarm.setSender("admin");
	    	
	    	alarmService.insertAlarm(alarm);
	    	
	    	// 내용
	    	String s2 = dto2.getNickName() + "님 🌳" + dto.getSubject() + "🌳 경매 상품에 낙찰자가 나왔습니다.";
	    	s2 += "<a href='"+articleUrl+"'>상품바로가기</a>";
	    	
	    	// 판매자에게 알림
	    	Alarm alarm2 = new Alarm();
	    	alarm2.setCnum(1);
	    	alarm2.setContent(s2);
	    	alarm2.setUserId(dto2.getUserId());
	    	alarm2.setSender("admin");
	    	
	    	alarmService.insertAlarm(alarm2);
	    	
	    	
	    	model.put("state", "true");
	    } catch (Exception e) {
	    	model.put("state", "false");
			e.printStackTrace();
		}
	
	    return model;
	}
	
	// ------ 문의 ------
	
	@GetMapping("write2")
	public String wrtieFrom2(
			@RequestParam(value = "page", defaultValue = "1") int page,
			@RequestParam long aNum,
			Model model) throws Exception {
		
		
		model.addAttribute("mode", "write2");
		model.addAttribute("page", page);
		model.addAttribute("aNum", aNum);
		
		return ".auction.write2";
	}
	
	@PostMapping("write2")
	public String writeSubmit2(AuctionBoard dto, HttpSession session,
			@RequestParam(value = "page", defaultValue = "1") int page) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setQuestionId(info.getUserId());
			bService.insertQuestion(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/auction/article?aNum=" + dto.getaNum() + "&page=" + page;
	}
	
	@ResponseBody
	@PostMapping("answer")
	public Map<String, Object> answerSubmit(AuctionBoard dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String state = "false";
		try {
			
			dto.setAnswerId(info.getUserId());
			bService.updateQuestion(dto);
			
			state = "true";
		} catch (Exception e) {
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("answerdelete")
	public String answerdelete(@RequestParam long qNum,
			AuctionBoard dto, @RequestParam(value = "page", defaultValue = "1") int page,
			HttpSession session) throws Exception {
		
		try {
			bService.deleteQuestion(qNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/auction/article?aNum=" + dto.getaNum() + "&page=" + page;
	}
	

}
