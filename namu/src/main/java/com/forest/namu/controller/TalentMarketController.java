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
import com.forest.namu.domain.Member;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.TalentMarket;
import com.forest.namu.service.TalentMarketService;




@Controller
@RequestMapping("/talent/*")
public class TalentMarketController {
	@Autowired
	private TalentMarketService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	
	@RequestMapping("list")
	public String list(Member member,TalentMarket dto, HttpSession session,
			@RequestParam(defaultValue = "0") long categoryNum,
			@RequestParam(defaultValue = "0") long typeNum,
			@RequestParam(defaultValue = "1") int talentShow,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,		
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			Model model) throws Exception{
		
		String cp = req.getContextPath();
		
		int size = 10;
		int total_page=0;
		int dataCount=0;
		
		List<TalentMarket> listCategory = service.listCategory(); 
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "UTF-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("talentShow", talentShow);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount= service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<TalentMarket> list = service.listTalentMarket(map);
		
		String listUrl = cp + "/talent/list";
		String articleUrl = cp + "/talent/article?page=" + current_page;
		
		String query ="";
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		if(query.length()!=0) {
		listUrl += "?" + query;
		articleUrl += "&"+query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		
		model.addAttribute("productShow", talentShow);
		model.addAttribute("type", typeNum);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		model.addAttribute("articleUrl", articleUrl);
		
		model.addAttribute("page", current_page);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".talentMarket.list";
	}
	
	@GetMapping("write")
	public String talentWrite(Member member,TalentMarket dto, HttpSession session, Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		member.setNickName(info.getNickName());
		
		model.addAttribute("member",member);
		
		List<TalentMarket> listCategory = service.listCategory();
		List<TalentMarket> listType = service.listType();
		
		model.addAttribute("mode", "write");
		model.addAttribute("listCategory",listCategory);
		model.addAttribute("listType",listType);
		
		return ".talentMarket.write";
	}
	
	@PostMapping("write")
	public String talentSubmit(TalentMarket dto,HttpSession session, Model model) {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertTalent(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String url = "redirect:/talent/list";
		
		return url;
	}
	
	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model)  throws Exception{
		
		kwd = URLDecoder.decode(kwd,"utf-8");
		
		String query="page=" + page;
		if(kwd.length()!=0) {
			query += "&schType=" + schType +
					"&kwd=" + URLEncoder.encode(kwd,"utf-8");
		}
		
		
		
		TalentMarket dto = service.findById(num);
		
		if(dto==null) {
			return "redirect:/talent/list?"+query;
		}
		
		List<TalentMarket> listFile = service.listTalentMarketFile(num);
		
		service.updateHitCount(num);
		
		
		
		model.addAttribute("dto",dto);
		model.addAttribute("query",query);
		model.addAttribute("listFile",listFile);
		
		
		return ".talentMarket.article";
	}
	
	@GetMapping("profile")
	public String profile() {
		return ".talentMarket.profile";
	}
}
