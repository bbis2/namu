package com.forest.namu.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forest.namu.domain.Member;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.TalentMarket;



@Controller
@RequestMapping("/talent/*")
public class TalentMarketController {
	
	@GetMapping("article")
	public String article() {
		return ".talentMarket.article";
	}
	
	@RequestMapping("list")
	public String list(Member member,TalentMarket dto, HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		member.setNickName(info.getNickName());
		
		model.addAttribute("member",member);
		
		return ".talentMarket.list";
	}
	
	@GetMapping("write")
	public String wirtetalent(Member member,TalentMarket dto, HttpSession session, Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		member.setNickName(info.getNickName());
		
		model.addAttribute("member",member);
		
		return ".talentMarket.write";
	}
	
	@GetMapping("profile")
	public String profile() {
		return ".talentMarket.profile";
	}
}
