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

import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.Together;
import com.forest.namu.service.TogetherService;

@Controller
@RequestMapping("/together/*")
public class TogetherController {
	
	@Autowired
	private TogetherService service;

	@Autowired
	private com.forest.namu.common.MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int categoryNum,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(value = "town", defaultValue = "") String town,
			HttpServletRequest req,
			Model model) throws Exception {
		
		
		int size = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd,"utf-8");
			town = URLDecoder.decode(town, "utf-8");
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("categoryNum", categoryNum);
		map.put("town", town);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (total_page < current_page) {
			current_page = total_page;
		}
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);	
		map.put("town", town);
		map.put("categoryNum", categoryNum);
		
		List<Together> list = service.listTogether(map);
		List<Together> listCategory = service.listTogetherCategory();
		
		String query = "town=" + town;
		String cp = req.getContextPath();
		String listUrl = cp + "/together/list";
		String articleUrl = cp + "/together/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		if (query.length() != 0) {
			listUrl = cp + "/together/list?" + query;
			articleUrl = cp + "/together/article?page=" + current_page + "&" + query;
		}
		if(categoryNum != 0) {
			if(query.length() != 0)
				query += "&categoryNum=" + categoryNum;
			else 
				query += "categoryNum=" + categoryNum;
		}
		if(town.length() != 0) {
			if(query.length() != 0)
				query += "&town=" + URLEncoder.encode(town,"utf-8");
			else 
				query += "town=" + URLEncoder.encode(town,"utf-8");
		}		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("town",town);
		
		return ".together.list";
	}
	
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		// 카테고리를 가져와서 던진다. 
		List<Together> listTogetherCategory = service.listTogetherCategory();
		
		model.addAttribute("listTogetherCategory", listTogetherCategory);
		model.addAttribute("mode", "write");
		return ".together.write";
	}
	
	@PostMapping("write")
	public String writesubmit(Together dto, HttpSession session) throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertTogether(dto,path);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/together/list";
	}
	
	   @GetMapping("article")
	   public String article() {
	     
	       return ".together.article";
	   }

}
