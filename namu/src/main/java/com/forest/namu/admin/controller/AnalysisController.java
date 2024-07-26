package com.forest.namu.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.forest.namu.admin.domain.Analysis;
import com.forest.namu.admin.service.AnalysisService;
import com.forest.namu.common.MyUtil;

@Controller
@RequestMapping("/admin/analysis/*")
public class AnalysisController {
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@Autowired
	private AnalysisService service;
	
	@RequestMapping("page")
	public String analysisHome(HttpServletRequest req,
			Analysis dto,
			Model model){
		
		try {
			dto = service.selectPageCount();
			model.addAttribute("dto",dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".admin.analysis.page";
	}

}
