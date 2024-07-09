package com.forest.namu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/daily/*")
public class DailyController {
	
	@GetMapping("list")
	public String list() {
		return ".daily.list";
	}
}
