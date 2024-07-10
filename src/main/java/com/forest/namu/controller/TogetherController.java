package com.forest.namu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/together/*")
public class TogetherController {
	
	@GetMapping("list")
	public String list() {
		return ".together.list";
	}
	
	
	@GetMapping("write")
	public String write() {
		return ".together.write";
	}
	
	
	@GetMapping("article")
	public String article() {
		return ".together.article";
	}
}
