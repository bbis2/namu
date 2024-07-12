package com.forest.namu.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.namu.domain.Point;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.PointService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {
	
	@Autowired
	private PointService service;
	
	@GetMapping("list")
	public String list(HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		long point = service.selectPoint(info.getUserId());
		
		model.addAttribute("userId",info.getUserId());
		model.addAttribute("point",point);
		
		return ".mypage.list";
	}
	
	@PostMapping("pointCharge")
	@ResponseBody
	public Map<String,Object> insertPoint(Point dto,HttpSession session)throws Exception{
		
		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertPoint(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("selectSeq")
	@ResponseBody
	public Map<String,Object> selectSequence()throws Exception{
		
		String state = "true";
		long sequence = 0;
		
		try {
			sequence = service.selectSeq();
			
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("sequence", sequence);
		
		return model;
	}
}
