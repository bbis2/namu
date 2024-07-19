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

import com.forest.namu.common.FileManager;
import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Borrow;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.BorrowService;

@Controller
@RequestMapping("/borrow/*")
public class BorrowController {
	
	@Autowired
	private BorrowService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private FileManager fileManager;

	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			Member member,
			Model model) throws Exception {

		String cp = req.getContextPath();
		
		int size = 6;
		int total_page;
		int dataCount;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", member.getUserId());
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Borrow> list = service.listBorrow(map);
		List<Borrow> category = service.listCategory(map);
		
		String query = "";
		String listUrl = cp + "/borrow/list";
		String articleUrl = cp + "/borrow/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		if (query.length() != 0) {
			listUrl = cp + "/borrow/list?" + query;
			articleUrl = cp + "/borrow/article?page=" + current_page + "&" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("category", category);
		model.addAttribute("member", member);
		
		return ".borrow.list";
	}
	
	@GetMapping("article")
	public String article() {
		return ".borrow.article";
	}
	
	@GetMapping("write")
	public String writeForm(Model model, Member member) throws Exception {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<Borrow> category = service.listCategory(map);
		
		model.addAttribute("category", category);
		model.addAttribute("member", member);
		model.addAttribute("mode", "write");
		
		return ".borrow.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Borrow dto, HttpSession session) throws Exception {
		System.out.println("writeSubmit");
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "album";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertBorrow(dto, path);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:/borrow/list";
	}
	
	
}




















