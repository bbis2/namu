package com.forest.namu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.TogetherNotice;
import com.forest.namu.service.TogetherNoticeService;

@RestController
@RequestMapping("/togetherNotice/*")
public class TogetherNoticeController {

	@Autowired
	private TogetherNoticeService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@PostMapping("write")
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
	
	@GetMapping("list2")
	public Map<String, Object> list(
			@RequestParam long num,
			@RequestParam(value = "pageNo", defaultValue ="1") int current_page,
			HttpSession session) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("num", num);
			
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
			
			model.put("list", list);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
		} catch (Exception e) {
		}
		
		return model;
	}
	
	
	

}
