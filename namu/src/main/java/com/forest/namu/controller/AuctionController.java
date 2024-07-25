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
import com.forest.namu.domain.Auction;
import com.forest.namu.domain.AuctionBoard;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.AuctionBoardService;
import com.forest.namu.service.AuctionService;

@Controller
@RequestMapping("/auction/*")
public class AuctionController {
	
	@Autowired
	private AuctionBoardService bService;
	
	@Autowired
	private AuctionService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(HttpServletRequest req,
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int cnum, 
			@RequestParam(defaultValue = "0") int town , 
			@RequestParam(defaultValue = "") String kwd,
			Model model) throws Exception {

		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
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
		
		List<Auction> listFile = service.listAuctionFile(aNum);
		dto.setUploadFile(dto.getImageFile());
		listFile.add(0, dto);
		
		service.updateHitCount(aNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("kwd", kwd);
		model.addAttribute("listFile", listFile);

		return ".auction.article";
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
		String paging = myUtil.pagingMethod(current_page, total_page, "listQna");
		
		model.addAttribute("qnalist", qnalist);
		
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
	
	@PostMapping("auctionLike")
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
	            service.deleteAuctionLike(map);
	            System.out.println("삭제");
	        } else {
	            service.insertAuctionLike(map);
	            System.out.println("추가");
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
	
	@PostMapping("bid")
	@ResponseBody
	public Map<String, Object> insertBid(Auction dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertBid(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		
		return model;
	}
}
