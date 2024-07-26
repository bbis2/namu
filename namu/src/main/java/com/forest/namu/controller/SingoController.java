package com.forest.namu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.Singo;
import com.forest.namu.service.SingoService;

@Controller
@RequestMapping("/singo/*")
public class SingoController {
	@Autowired
	private SingoService service;
	
	@PostMapping("reception")
	public String insertReport(HttpSession session,
			Singo dto)throws Exception{
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String tableName = dto.getField();
		
		try {
			dto.setUserId(info.getUserId());
			service.insertReport(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return "redirect:/"+tableName+"/list";
	}
}
