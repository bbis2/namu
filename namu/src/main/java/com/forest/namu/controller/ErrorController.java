package com.forest.namu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error/*")
public class ErrorController {

	@RequestMapping("error")
	public String error() {
		
		return "/error/error";
	}
}
