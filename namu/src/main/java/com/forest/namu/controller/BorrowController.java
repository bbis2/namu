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
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
			@RequestParam(defaultValue = "0") String categoryNum,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "1") String townNum,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {

		String cp = req.getContextPath();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		int size = 10;
		int total_page;
		int dataCount;
		String location;
		
		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", info.getUserId());
		map.put("categoryNum", categoryNum);
		map.put("kwd", kwd);
		
		location = townNum.equals("1") ? info.getTown1() : info.getTown2();
		
		map.put("location", location);
		
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
		
		List<Borrow> category = service.listCategory();
		// 카테고리 표시
		String categoryName = "전체";
		for(Borrow categoryList : category) {
			if(categoryList.getCategoryNum() == Integer.parseInt(categoryNum)) {
				categoryName = categoryList.getCategory();
			}
		}
		
		// 시간 표시
		for(Borrow dto : list) {
			dto.setPassedTime(myUtil.returnPassedTime(dto.getRegDate())); 
		}
		
		String query = "";
		String listUrl = cp + "/borrow/list?townNum=" + townNum;
		String articleUrl = cp + "/borrow/article?townNum=" + townNum + "&categoryNum=" + categoryNum + "&page=" + current_page;
		if (kwd.length() != 0) {
			query = "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		if (query.length() != 0) {
			listUrl = cp + "/borrow/list?townNum=" + townNum + query;
			articleUrl = cp + "/borrow/article?townNum=" + townNum + "&categoryNum=" + categoryNum + "&page=" + current_page + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("townNum", townNum);
		model.addAttribute("location", location);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("kwd", kwd);
		
		model.addAttribute("category", category);
		model.addAttribute("categoryName", categoryName);
		
		return ".borrow.list";
	}
	
	@GetMapping("article")
	public String article(
			@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "0") String categoryNum,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam String townNum,
			Model model
			) throws Exception {
		
		
		service.updateHitCount(num);
		
		Borrow dto = service.findById(num);
		categoryNum = dto.getCategoryNum() + "";
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "townNum=" + townNum + "&page=" + page + "&categoryNum=" + categoryNum;
		if (kwd.length() != 0) {
			query += "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		// 게시글 등록한지 얼마나 지났는지 계산해서 set
		dto.setPassedTime(myUtil.returnPassedTime(dto.getRegDate()));
		
		// 대여희망시간 날짜형식 변환해서 set
		dto.setStrDate(myUtil.convertDateFormat(dto.getStrDate()));
		dto.setEndDate(myUtil.convertDateFormat(dto.getEndDate()));
		
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		
		// 글쓴이 정보 가져오기
		Member writer = service.borrowWriter(num);
		writer.setRegDate(myUtil.convertDateFormat(writer.getRegDate()).substring(0, 9));
		
		// 이미지 파일
		List<Borrow> listImage = service.listBorrowImage(num);
		// 카테고리
		List<Borrow> category = service.listCategory();
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("writer", writer);
		model.addAttribute("listImage", listImage);
		model.addAttribute("category", category);
		
		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		return ".borrow.article";
	}
	
	@GetMapping("write")
	public String writeForm(Model model, Member member) throws Exception {
		
		List<Borrow> category = service.listCategory();
		
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
			e.printStackTrace();
		}
		return "redirect:/borrow/list";
	}
	
	@PostMapping("insertLike")
	@ResponseBody
	public Map<String, Object> insertLike(
			@RequestParam long num,
			@RequestParam boolean userLiked,
			HttpSession session
			) {
		
		String state = "true";
		int borrowLikeCount = 0;
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				service.insertBorrowLike(paramMap);
			} else {
				service.deleteBorrowLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		borrowLikeCount = service.borrowLikeCount(num);
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("borrowLikeCount", borrowLikeCount);
		
		return model;
	}
	
}




















