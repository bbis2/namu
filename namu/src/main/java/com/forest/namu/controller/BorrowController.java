package com.forest.namu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/borrow/*")
public class BorrowController {

	@GetMapping("list")
	public String list() {
		return ".borrow.list";
	}
	
	@GetMapping("article")
	public String article() {
		return ".borrow.article";
	}
}
