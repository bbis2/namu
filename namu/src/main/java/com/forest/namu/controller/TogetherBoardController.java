package com.forest.namu.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.forest.namu.domain.BoardReply;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.TogetherBoard;
import com.forest.namu.service.TogetherBoardService;


@Controller
@RequestMapping("/togetherBoard/*")
public class TogetherBoardController {
	@Autowired
	private TogetherBoardService service;
	
	@Autowired
	private MyUtil myUtil;

	@PostMapping("write")	
	@ResponseBody
	public Map<String, Object> writeSubmit(TogetherBoard dto,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo";
		
		String state = "true";
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			
			service.insertTogetherBoard(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("list")
	public String list(
	        @RequestParam long tNum,
	        @RequestParam(value = "pageNo", defaultValue = "1") int current_page,
	        Model model,
	        HttpSession session) throws Exception {

	    SessionInfo info = (SessionInfo) session.getAttribute("member");

	    try {
	        Map<String, Object> map = new HashMap<>();

	        int size = 5;
	        int dataCount;

	        map.put("tNum", tNum);
	        map.put("userId", info.getUserId());

	        dataCount = service.dataCount(map);

	        int total_page = myUtil.pageCount(dataCount, size);
	        if (current_page > total_page) {
	            current_page = total_page;
	        }

	        int offset = (current_page - 1) * size;
	        if (offset < 0) offset = 0;

	        map.put("offset", offset);
	        map.put("size", size);

	        List<TogetherBoard> list = service.listTogetherBoard(map);

	        String paging = myUtil.pagingFunc(current_page, total_page, "listTogetherBoard"); // listTogetherBoard : 페이징 처리 

	        model.addAttribute("list", list);
	        model.addAttribute("dataCount", dataCount);
	        model.addAttribute("size", size);
	        model.addAttribute("pageNo", current_page);
	        model.addAttribute("paging", paging);
	        model.addAttribute("total_page", total_page);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return "together/listBoard";
	}
	
	@GetMapping("article")
	public String article(
	        long num,
	        Model model,
	        HttpSession session) throws Exception {
		
		TogetherBoard dto = service.findById(num);
		
		List<TogetherBoard> listFile = service.listTogetherBoardFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("listFile", listFile);
		
		return "together/articleBoard";
		
	}
	
	@GetMapping("deleteBoard")
	public String delete (@RequestParam long num, 
			@RequestParam String page,
			HttpSession session) throws Exception {
		
		String query = "page=" + page;
		
		service.deleteTogetherBoard(num, query);
		
		return "redirect:/daily/list?" +query;
	}
	
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, 
			@RequestParam String filename,
			HttpSession session) throws Exception {

		String state = "true";
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "product" + File.separator + filename;

			service.deleteTogetherBoardFile(fileNum,pathname);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}

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
		
		List<BoardReply> listReply = service.listReply(map);

		String paging = myUtil.pagingMethod(current_page, total_page, "listTogetherBoardReply");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "together/articleBoardReply";
	}
	
	@PostMapping("insertReply")
	@ResponseBody
	public Map<String, Object> insertReply(BoardReply dto, HttpSession session) {
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
	
}
