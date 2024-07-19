package com.forest.namu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rent/*")
public class RentController {

	@GetMapping("list")
	public String list() {
		return ".rent.list";
	}
	
	@GetMapping("article")
	public String article() {
		return ".rent.article";
	}
	
	@GetMapping("write")
	public String write() {
		return ".rent.write";
	}
	
	@PostMapping("write")
	public String writeSubmit() {
		return ".rent.list";
	}
	
}
