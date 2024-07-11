package com.forest.namu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/challenge/*")
public class ChallengeController {

	@RequestMapping("list") 
	public String list() {
		return ".challenge.list";
	}
	
	@RequestMapping("wirte") 
	public String wirte() {
		return ".challenge.list";
	}
}
