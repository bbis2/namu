package com.forest.namu.controller;

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
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.TogetherNotice;
import com.forest.namu.service.TogetherNoticeService;

@Controller
@RequestMapping("/togetherNotice/*")
public class TogetherNoticeController {

	@Autowired
	private TogetherNoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@PostMapping("write")
	@ResponseBody
	public Map<String, Object> writeSubmit(TogetherNotice dto, HttpSession session) throws Exception {
	
		String state = "true";
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			service.insertNotice(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@GetMapping("list")
	public String list(
			@RequestParam long tNum,
			@RequestParam(value = "pageNo", defaultValue ="1") int current_page,
			HttpSession session,
			Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("tNum", tNum);
			map.put("userId", info.getUserId());
			
			dataCount = service.dataCount(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if(current_page > total_page) {
			}
			
			int offset = (current_page -1 ) * size;
			if(offset < 0) offset = 0;
			
			map.put("offset", offset);
			map.put("size", size);
			
			List<TogetherNotice> list = service.listTogetherNotice(map);
	
			String paging = myUtil.pagingFunc(current_page, total_page, "listTogetherNotice");
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("pageNo", current_page);
			model.addAttribute("paging", paging);
			model.addAttribute("total_page", total_page);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "together/listNotice";
	}
	
	@PostMapping("deleteNotice")
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";
		
		try {
			service.deleteNotice(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}	


}
