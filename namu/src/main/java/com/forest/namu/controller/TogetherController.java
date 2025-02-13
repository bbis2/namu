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

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Profile;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.Together;
import com.forest.namu.domain.TogetherApply;
import com.forest.namu.service.MypageService;
import com.forest.namu.service.TogetherService;

@Controller
@RequestMapping("/together/*")
public class TogetherController {
	
	@Autowired
	private TogetherService service;

	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private MypageService myService;	
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "0") int categoryNum,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			@RequestParam(value = "town", defaultValue = "") String town,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
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
		
		Profile userdto = myService.selectProfile(info.getUserId());
		
		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);
		
		model.addAttribute("userdto", userdto);

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
	public String article(
			@RequestParam long tNum,
			@RequestParam(defaultValue = "1")  String page,
			@RequestParam(defaultValue = "all") String schType, 
			@RequestParam(defaultValue = "")String kwd,
			HttpSession session,
			Model model,
			@RequestParam(defaultValue = "0") int categoryNum,
			@RequestParam(value = "town", defaultValue = "") String town) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		kwd  = URLDecoder.decode(kwd, "utf-8");
		town  = URLDecoder.decode(town, "utf-8");
		
		String query = "page=" + page;
		if(categoryNum != 0) {
			query += "&categoryNum=" + categoryNum;
		}
		if(kwd.length() != 0 ) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		if(town.length() != 0) {
			query += "&town=" + URLEncoder.encode(town,"utf-8");
		}
		
		service.updateHitCount(tNum);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("tNum", tNum);
		
		Together dto = service.findById(map);
		if(dto == null) {
			return "redirect:/together/list?" + query;
		}
		
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("town", town);
		
		// 이전글 다음글
		Together prevDto = service.findByPrev(map);
		Together nextDto = service.findByNext(map);
		
		
		// 게시글 좋아요
		map.put("userId", info.getUserId());
		boolean userTogetherLiked  = service.userFreeBoardLiked(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);
		
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("town",town);
		
		model.addAttribute("userTogetherLiked",userTogetherLiked );
		
		return ".together.article";
	}
	
	@GetMapping("update")
	public String udateForm (
			@RequestParam long tNum,
			@RequestParam  String page,
			HttpSession session,
			Model model,
			@RequestParam(defaultValue = "0") long categoryNum,
			@RequestParam(value = "town", defaultValue = "") String town) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		List<Together> listTogetherCategory = service.listTogetherCategory();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("tNum", tNum);
		Together dto = service.findById(map);
		
		if(dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/together/list?page=" + page;
		}
		
		model.addAttribute("dto",dto);
		model.addAttribute("mode","update");
		model.addAttribute("page",page);
		model.addAttribute("categoryNum", categoryNum);
		model.addAttribute("town",town);
		model.addAttribute("listTogetherCategory", listTogetherCategory );
		
		return ".together.write";
		
	}
	
	@PostMapping("update")
	public String updateSunbmit( 
			Together dto,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo";		

		service.updateTogether(dto, pathname);
		
	return "redirect:/together/list";
	}
	
	
	@GetMapping("delete")
	public String delete (
			@RequestParam long tNum,
			@RequestParam String page, 
			@RequestParam (defaultValue = "all") String schType,
			@RequestParam (defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		kwd = URLDecoder.decode(kwd, "utf-8");
		
		String query = "page=" + page;
		if(kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd,"UTF-8");
		}
		
		service.deleteTogether(tNum, info.getUserId(), info.getMembership());
		
		return "redirect:/together/list?"+query;
	}
	
	@PostMapping("insertLike")
	@ResponseBody
	public Map<String, Object> insertLike(
			@RequestParam long num,
			@RequestParam boolean userLiked,
			HttpSession session
			) {
		
		String state = "true";
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("num", num);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				service.insertFreeBoardLike(paramMap);
			} else {
				service.deleteFreeBoardLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	@PostMapping("apply")
	@ResponseBody
	public Map<String, Object> insertTogetherApply (TogetherApply dto, HttpSession session) throws Exception {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		String state = "true";
		
		try {
			dto.setUserId(info.getUserId());
			service.insertTogetherApply(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("tNum", dto.gettNum());
		model.put("userId", info.getUserId());
		model.put("content", dto.getContent());
		
		return model;
	}
	
	@GetMapping("applyList")
	public String listApply (
			@RequestParam Map<String, Object> paramMap,
			HttpSession session,
			Model model) throws Exception {
		
		List<TogetherApply> listApply = service.listApply(paramMap);
		
		model.addAttribute("listApply",listApply);
		
		return "together/applyList";
	}
	
	
	@ResponseBody
	@PostMapping("applyUpdate")
	public Map<String, Object> updateApply(TogetherApply dto) throws Exception {
		String state = "true";
		
			try {
				service.updateApply(dto);
			} catch (Exception e) {
				 state = "false";
			}
			
			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			
			return model;
	}
	
	   @GetMapping("togetherNotice")
	   public String article() {
	     
	       return ".together.togetherNotice";
	   }
	   
		
	   @GetMapping("togetherBoard")
	   public String write() {
	     
	       return ".together.togetherBoard";
	   }
	
}
