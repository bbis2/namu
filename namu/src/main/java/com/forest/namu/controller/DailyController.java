package com.forest.namu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/daily/*")
public class DailyController {
	
	
	@RequestMapping("list")
	public String list() {
		/*
		public String list (
				@RequestParam (value = "page", defaultValue = "1") int current_page,
				@RequestParam ( defaultValue = "all") Sting schType,
				@RequestParam (defaultValue = "") String kwd,
				HttpServeletRequest req, 
				Model model
				) throws Exception;
		*/
		return ".daily.list";
	}
	
	
	@GetMapping("write")
	public String write() {
		return ".daily.write";
	}
	
	@GetMapping("article")
	public String article() {
		return ".daily.article";
	}
}
