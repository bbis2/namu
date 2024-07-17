package com.forest.namu.controller;

import java.io.File;
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
import com.forest.namu.domain.Used;
import com.forest.namu.service.UsedService;

@Controller
@RequestMapping("/used/*")
public class UsedController {
	
	@Autowired
	private UsedService service;
	
	@RequestMapping(value = "list")
	public String list(HttpServletRequest req,
			Model model, @RequestParam(defaultValue = "") String kwd) throws Exception {

		int dataCount = 0;
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		
		List<Used> list = service.listUsed(map);
		model.addAttribute("list", list);
		model.addAttribute("kwd", kwd);
		model.addAttribute("dataCount", dataCount);
		
		return ".used.list";
	}
	
	@GetMapping("write")
	public String wrtieFrom(Model model) throws Exception {
		
		
		model.addAttribute("mode", "write");
		
		return ".used.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Used dto, HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "photo";
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		try {
			dto.setUserId(info.getUserId());
			service.insertUsed(dto, path);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/used/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		Used dto = service.findById(num);
		
		List<Used> listFile = service.listUsedFile(num);
		dto.setUploadFile(dto.getImageFile());
		listFile.add(0, dto);

		service.updateHitCount(num);
		
		int likeCount = service.likeCount(num);

		model.addAttribute("dto", dto);
		model.addAttribute("kwd", kwd);
		model.addAttribute("likeCount", likeCount);
		model.addAttribute("listFile", listFile);

		return ".used.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			HttpSession session, Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Used dto = service.findById(num);
		if(dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/used/list";
		}
		
		
		System.out.println("확인!!!!!"+dto.getSelectFile());
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		
		return ".used.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(HttpSession session, Used dto) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo";
		
		service.updateUsed(dto, pathname);
		
		return "redirect:/used/list";
		
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam long num,
			@RequestParam String imageFile,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "photo" + File.separator + imageFile;

		service.deleteUsed(num, pathname);
		
		return "redirect:/used/list";
	}
}
