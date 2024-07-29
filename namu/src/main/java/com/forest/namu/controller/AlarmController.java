package com.forest.namu.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Alarm;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.AlarmService;


@Controller
@RequestMapping("/alarm/*")
public class AlarmController {
	@Autowired
	private AlarmService service;
	
	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int cnum, 
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd", kwd);
		map.put("cnum", cnum);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		
		List<Alarm> list = service.listAlarm(map);
		List<Alarm> listCategory = service.listCategory();
		
		String query = "";
		String cp = req.getContextPath();
		String listUrl;
		String articleUrl;
		if(kwd.length() != 0) {
			query = "kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		if(cnum != 0) {
			query += "&cnum=" + cnum;
		}
		
		listUrl = cp + "/alarm/list";
		articleUrl = cp + "/alarm/article?page=" + current_page;
		if(query.length() != 0) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);		
		
		model.addAttribute("list", list);
		model.addAttribute("kwd", kwd);
		model.addAttribute("cnum", cnum);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);		
		model.addAttribute("listCategory", listCategory);
		return ".alarm.list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long alarmNum, @RequestParam String page,
			@RequestParam(defaultValue = "0") int cnum, 
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + alarmNum;
		if (kwd.length() != 0) {
			query += "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd", kwd);
		map.put("alarmNum", alarmNum);
		
		Alarm dto = null;
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));

		model.addAttribute("dto", dto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".alarm.article";
		
	}
	
}
