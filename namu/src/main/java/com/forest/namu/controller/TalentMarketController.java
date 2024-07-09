package com.forest.namu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/talent/*")
public class TalentMarketController {
	
	@GetMapping("article")
	public String article() {
		return ".talentMarket.article";
	}
	
	@GetMapping("list")
	public String list() {
		return ".talentMarket.list";
	}
	
	@GetMapping("profile")
	public String profile() {
		return ".talentMarket.profile";
	}
}
