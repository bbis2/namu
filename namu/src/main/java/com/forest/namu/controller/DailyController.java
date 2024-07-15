package com.forest.namu.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Daily;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.DailyService;

@Controller
@RequestMapping("/daily/*")
public class DailyController {
	
	@Autowired
	private DailyService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value="page", defaultValue = "1") int current_page, 
			@RequestParam(value = "long", defaultValue = "0") long categoryNum,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 10;
		int total_page = 0;
		int dataCount= 0;
		
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");	
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		if(dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page -1) * size;
		if(offset <0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		
		//List<Daily>  listDailyCategory = service.listDailyCategory(map);
		
		List<Daily> list = service.listDaily(map);
		
		String query = "";
		String cp = req.getContextPath();
		String listUrl;
		String articleUrl;
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + 
					URLEncoder.encode(kwd,"utf-8");
		}
		
		listUrl = cp + "/daily/list";
		articleUrl= cp + "/daily/article?page="+ current_page;
		if(query.length() != 0 ) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("paging", paging);
				
		return ".daily.list";
	}
	
	
	@GetMapping("write")
	public String writeForm(Member member, HttpSession session, Model model) throws Exception {
		// 카테고리를 가져와서 던진다. 
		// Long listDailyCategory = service.listDailyCategory(categoryNum);
		// model.addAttribute("listDailyCategory", listDailyCategory);
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		member.setNickName(info.getNickName());
	
		model.addAttribute("member", member);
		model.addAttribute("mode", "write");
		return ".daily.write";
	}
	
	@PostMapping("write")
	public String writesubmit( Daily dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root +"uploads" + File.separator + "daily";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertDaily(dto, pathname);
			
		} catch (Exception e) {
		}
		
		return "redirect:/daily/list";
	}
	
	
	@GetMapping("article")
	public String article() {
		return ".daily.article";
	}
}
