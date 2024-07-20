package com.forest.namu.controller;

import java.io.File;
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
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("kwd", kwd);
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
		
		List<Used> listFile = service.listUsedFile(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("listFile", listFile);
		
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
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long fileNum, 
			@RequestParam String filename,
			HttpSession session) throws Exception {

		String state = "true";
		try {
				
			service.deleteUsedFile(fileNum);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("usedLike")
	@ResponseBody
	public Map<String, Object> usedLike(@RequestParam int num, 
	                                    @RequestParam boolean userLiked, HttpSession session) {

	    String state = "true";
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("num", num);
	    map.put("userId", info.getUserId());
	    
	    try {
	        if (userLiked) {
	            service.deleteUsedLike(map);
	            System.out.println("삭제");
	        } else {
	            service.insertUsedLike(map);
	            System.out.println("추가");
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
	
}
