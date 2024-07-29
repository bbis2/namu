package com.forest.namu.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.namu.admin.domain.Analysis;
import com.forest.namu.admin.service.AnalysisService;
import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Point;
import com.forest.namu.domain.SessionInfo;

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
			
			List<Analysis> list = service.selectAlldayCount();
			model.addAttribute("list",list);
			model.addAttribute("dto",dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".admin.analysis.page";
	}
	
	@RequestMapping("page2")
	public String analysisPage2(HttpServletRequest req,
			Analysis dto,
			Model model){
		
		try {
			dto = service.selectPageCount();
			
			List<Analysis> list = service.selectDayPageCount();
			List<Analysis> list2 = service.selectWeekPageCount();
			List<Analysis> list3 = service.selectMonthPageCount();
			List<Analysis> list4 = service.selectHitpage();
			model.addAttribute("list",list);
			model.addAttribute("list2",list2);
			model.addAttribute("list3",list3);
			model.addAttribute("list4",list4);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".admin.analysis.page2";
	}
	
	@RequestMapping("page3")
	public String analysisPage3(HttpServletRequest req,
			Analysis dto,
			Model model){
		
		try {
			long result1 = service.selectSeoul();
			long result2 = service.selectBusan();
			long result3 = service.selectDaegu();
			long result4 = service.selectInchoen();
			long result5 = service.selectGwangju();
			long result6 = service.selectDaejoen();
			long result7 = service.selectUlsan();
			long result8 = service.selectSejong();
			long result9 = service.selectGyeongGi();
			long result10 = service.selectGwanhwon();
			long result11 = service.selectGwanhwon();
			long result12 = service.selectChungbuk();
			long result13 = service.selectChungnam();
			long result14 = service.selectJeonbuk();
			long result15 = service.selectJeonnam();
			long result16 = service.selectGyeongbuk();
			long result17 = service.selectGyeongnam();
			long result18 = service.selectJeju();
			
			long result = result1 + result2 + result3 + result4 + result5 + result6 + result7 + result8 + result9 + result10 + result11 + result12 + result13 + result14 + result15 + result16 + result17 + result18;

			model.addAttribute("result",result);
			model.addAttribute("result1", result1);
			model.addAttribute("result2", result2);
			model.addAttribute("result3", result3);
			model.addAttribute("result4", result4);
			model.addAttribute("result5", result5);
			model.addAttribute("result6", result6);
			model.addAttribute("result7", result7);
			model.addAttribute("result8", result8);
			model.addAttribute("result9", result9);
			model.addAttribute("result10", result10);
			model.addAttribute("result11", result11);
			model.addAttribute("result12", result12);
			model.addAttribute("result13", result13);
			model.addAttribute("result14", result14);
			model.addAttribute("result15", result15);
			model.addAttribute("result16", result16);
			model.addAttribute("result17", result17);
			model.addAttribute("result18", result18);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".admin.analysis.page3";
	}
	
	@RequestMapping("point")
	public String point(HttpServletRequest req,
			Analysis dto,
			Model model){
		
		try {
			List<Analysis> list = service.sumedMoney();
			List<Analysis> list2 = service.sumedMoneyMonth();
			List<Analysis> list3 = service.selectUser();
			long totalMoney = service.allPoint();
			long totalRefund = service.totalRefund();
			
			long allCharge = service.chargeAll();
			long allRefund = service.refundALl();
			
			model.addAttribute("allCharge",allCharge);
			model.addAttribute("allRefund",allRefund);
			model.addAttribute("list",list);
			model.addAttribute("list2",list2);
			model.addAttribute("list3",list3);
			model.addAttribute("totalMoney",totalMoney);
			model.addAttribute("totalRefund",totalRefund);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return ".admin.analysis.point";
	}
	
	@GetMapping("userPoint")
	@ResponseBody
	public Map<String, Object> selectAll(HttpSession session,
			@RequestParam String userId) throws Exception {

		String state = "true";

		List<Analysis> listAll = service.selectPoint(userId);

		if (listAll.isEmpty()) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("listAll", listAll);

		return model;
	}

}
