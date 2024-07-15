package com.forest.namu.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forest.namu.domain.Member;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.TalentMarket;
import com.forest.namu.service.TalentMarketService;



@Controller
@RequestMapping("/talent/*")
public class TalentMarketController {
	@Autowired
	private TalentMarketService service;
	
	@GetMapping("article")
	public String article() {
		return ".talentMarket.article";
	}
	
	@RequestMapping("list")
	public String list(Member member,TalentMarket dto, HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		model.addAttribute("member",member);
		
		return ".talentMarket.list";
	}
	
	@GetMapping("write")
	public String wirtetalent(Member member,TalentMarket dto, HttpSession session, Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		member.setNickName(info.getNickName());
		
		model.addAttribute("member",member);
		
		List<TalentMarket> listCategory = service.listCategory();
		List<TalentMarket> listType = service.listType();
		
		
		model.addAttribute("listCategory",listCategory);
		model.addAttribute("listType",listType);
		
		return ".talentMarket.write";
	}
	
	@GetMapping("profile")
	public String profile() {
		return ".talentMarket.profile";
	}
}
