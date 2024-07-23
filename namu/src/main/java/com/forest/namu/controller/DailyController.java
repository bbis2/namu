package com.forest.namu.controller;

import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Daily;
import com.forest.namu.domain.Reply;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.DailyService;
import com.mongodb.DuplicateKeyException;

@Controller
@RequestMapping("/daily/*")
public class DailyController {
	
	@Autowired
	private DailyService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value="page", defaultValue = "1") int current_page, 
			@RequestParam(defaultValue = "0") int categoryNum,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(value = "town", defaultValue = "") String town,
			HttpServletRequest req,
			Model model,
			HttpSession session) throws Exception {
	
		int size = 10;
		int total_page = 0;
		int dataCount= 0;
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
			town = URLDecoder.decode(town, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("categoryNum", categoryNum);
		map.put("town", town);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page -1) * size;
		if(offset <0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		
		// 글 리스트 
		List<Daily> list = service.listDaily(map);

		String query = "";
		String cp = req.getContextPath();
		String listUrl;
		String articleUrl;
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + 
					URLEncoder.encode(kwd,"utf-8");
		}
		if(categoryNum != 0) {
			if(query.length() != 0)
				query += "&categoryNum=" + categoryNum;
			else 
				query += "categoryNum=" + categoryNum;
		}
		if(town.length() != 0) {
			if(query.length() != 0)
				query += "&town=" + URLEncoder.encode(town,"utf-8");
			else 
				query += "town=" + URLEncoder.encode(town,"utf-8");
		}
		
		listUrl = cp + "/daily/list";
		articleUrl= cp + "/daily/article?page="+ current_page;
		if(query.length() != 0 ) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("size", size);
	
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("town", town);
				
		return ".daily.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		// 카테고리를 가져와서 던진다. 
		List<Daily> listDailyCategory = service.listDailyCategory();
		
		model.addAttribute("listDailyCategory", listDailyCategory);
		model.addAttribute("mode", "write");
		return ".daily.write";
	}
	
	@PostMapping("write")
	public String writesubmit( Daily dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertDaily(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/daily/list";
	}
	
	@GetMapping("article")
	public String article(
			@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model,
			@RequestParam(defaultValue = "0") int categoryNum,
			@RequestParam(value = "town", defaultValue = "") String town) throws Exception{
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		town = URLDecoder.decode(town, "utf-8");
		
		String query = "page=" + page;
		if(categoryNum != 0) {
			query += "&categoryNum=" + categoryNum;
		}		
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8"); 
		}
		if(town.length() != 0) {
			query += "&town=" + URLEncoder.encode(town,"utf-8");
		}
		
		service.updateHitCount(num);
		
		Daily dto = service.findById(num);
		if(dto == null) {
			return "redirect:/daily/list?" + query;
		}
		
		// 이전글 다음글
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("town", town);
		map.put("num", num);
		
		Daily prevDto = service.findByPrev(map);
		Daily nextDto = service.findByNext(map);
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		// 게시글 좋아요
		map.put("userId", info.getUserId());
		boolean userDailyLiked = service.userDailyLiked(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("town",town);
		model.addAttribute("userDailyLiked", userDailyLiked);
		
		return ".daily.article";
	}
	
	
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model,
			@RequestParam(defaultValue = "0") long categoryNum) throws Exception{

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		List<Daily> listDailyCategory = service.listDailyCategory();
		
		Daily dto = service.findById(num);
		if(dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/daily/list?page=" + page;
		}
		
		model.addAttribute("dto",dto);
		model.addAttribute("mode","update");
		model.addAttribute("page",page);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("listDailyCategory", listDailyCategory);
		return ".daily.write";
		
	}
	
	@PostMapping("update")
	public String updateSubmit(Daily dto, 
			@RequestParam String page,
			@RequestParam(defaultValue = "0") long categoryNum,
			HttpSession session) throws Exception {	
		
		String query = "page=" + page;
		if(categoryNum != 0) {
			query += "&categoryNum=" + categoryNum;
		}
		
		try {
			service.updateDaily(dto);
		} catch (Exception e) {
		}

		return "redirect:/daily/list?"+query;
	}
	
	@GetMapping("delete")
	public String delete (@RequestParam long num, 
			@RequestParam String page,
			@RequestParam (defaultValue = "all") String schType,
			@RequestParam (defaultValue = "") String kwd,
			@RequestParam(defaultValue = "0") long categoryNum,
			@RequestParam(value = "town", defaultValue = "") String town,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		kwd = URLDecoder.decode(kwd,"utf-8");
		
		String query = "page=" + page;
		if(categoryNum != 0) {
			query += "&categoryNum=" + categoryNum;
		}
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd,"UTF-8");
		}
		if(town.length() != 0) {
			query += "&town=" + URLEncoder.encode(town,"utf-8");
		}
		
		service.deleteDaily(num, info.getUserId(), info.getMembership());
		
		return "redirect:/daily/list?" +query;
	}
	
	@PostMapping("insertDailyLike")
	@ResponseBody
	public Map<String, Object> insertDailyLike(
			@RequestParam long num,
			@RequestParam boolean userLiked,
			HttpSession session) {
		
		String state = "true";
		int dailyLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				service.deleteDailyLike(paramMap);
			}else {
				service.insertDailyLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		dailyLikeCount =service.dailyLikeCount(num);
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("dailyLikeCount", dailyLikeCount);
		
		return model;
	}
	
	// 댓글 리스트 : AJAX-TEXT
	@GetMapping("listReply")
	public String listReply(@RequestParam long num, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session,
			Model model) throws Exception {

		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 5;
		int total_page = 0;
		int dataCount = 0;

		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		
		map.put("membership", info.getMembership());
		map.put("userId", info.getUserId());
		
		dataCount = service.replyCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		List<Reply> listReply = service.listReply(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "daily/listReply";
	}
	
	@PostMapping("insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(Reply dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state = "true";

		try {
			dto.setUserId(info.getUserId());
			service.insertReply(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
	
	// 댓글의 답글 리스트 
	@GetMapping("listReplyAnswer")
	public String listReplyAnswer(@RequestParam Map<String, Object> paramMap, 
	        HttpSession session, Model model) throws Exception {
	    SessionInfo info = (SessionInfo) session.getAttribute("member");

	    paramMap.put("membership", info.getMembership());
	    paramMap.put("userId", info.getUserId());

	    // 파라미터 출력
	    System.out.println("paramMap: " + paramMap);

	    List<Reply> listReplyAnswer = service.listReplyAnswer(paramMap);

	    model.addAttribute("listReplyAnswer", listReplyAnswer);
	    return "daily/listReplyAnswer";
	}

	@PostMapping(value = "countReplyAnswer")
	@ResponseBody
	public Map<String, Object> countReplyAnswer(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		paramMap.put("membership", info.getMembership());
		paramMap.put("userId", info.getUserId());
		
		int count = service.replyAnswerCount(paramMap);

		Map<String, Object> model = new HashMap<>();
		model.put("count", count);
		return model;
	}
	
	@PostMapping("insertReplyLike")
	@ResponseBody
	public Map<String, Object> insertReplyLike(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		String state = "true";

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> model = new HashMap<>();

		try {
			paramMap.put("userId", info.getUserId());
			service.insertReplyLike(paramMap);
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> countMap = service.replyLikeCount(paramMap);

		int likeCount = ((BigDecimal) countMap.get("LIKECOUNT")).intValue();
		int disLikeCount = ((BigDecimal)countMap.get("DISLIKECOUNT")).intValue();
		
		model.put("likeCount", likeCount);
		model.put("disLikeCount", disLikeCount);
		model.put("state", state);
		return model;
	}
	
	@PostMapping("countReplyLike")
	@ResponseBody
	public Map<String, Object> countReplyLike(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {

		Map<String, Object> countMap = service.replyLikeCount(paramMap);

		int likeCount = ((BigDecimal) countMap.get("LIKECOUNT")).intValue();
		int disLikeCount = ((BigDecimal)countMap.get("DISLIKECOUNT")).intValue();
		
		Map<String, Object> model = new HashMap<>();
		model.put("likeCount", likeCount);
		model.put("disLikeCount", disLikeCount);

		return model;
	}
	
	@PostMapping("replyShowHide")
	@ResponseBody
	public Map<String, Object> replyShowHide(@RequestParam Map<String, Object> paramMap,
			HttpSession session) {
		String state = "true";

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			paramMap.put("userId", info.getUserId());
			service.updateReplyShowHide(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}	
}
