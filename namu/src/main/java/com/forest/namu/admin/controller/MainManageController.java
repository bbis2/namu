package com.forest.namu.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.forest.namu.admin.domain.Analysis;
import com.forest.namu.admin.service.AnalysisService;
import com.forest.namu.domain.Member;

@Controller
public class MainManageController {
	@Autowired
	private AnalysisService service;
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String method(Model model) throws Exception {
		List<Analysis> list = service.sumedMoney();

		List<Analysis> list2 = service.selectAlldayCount();
		List<Member> list3 = service.selectNewBi();
		long countNew = service.countNewBi();
		long countInquiry = service.countInquiry();
		long countSingo = service.countSingo();
		
		model.addAttribute("countSingo",countSingo);
		model.addAttribute("countInquiry",countInquiry);
		model.addAttribute("countNew",countNew);
		model.addAttribute("list3",list3);
		model.addAttribute("list2",list2);
		model.addAttribute("list",list);
		return ".adminLayout";
	}

}
