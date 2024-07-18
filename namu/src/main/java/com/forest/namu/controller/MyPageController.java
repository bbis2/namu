package com.forest.namu.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.domain.Point;
import com.forest.namu.domain.Profile;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.MypageService;
import com.forest.namu.service.PointService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@Autowired
	private PointService service;
	
	@Autowired
	private MypageService myService;
	

	@GetMapping("list")
	public String list(HttpSession session, Model model) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		long point = service.selectPoint(info.getUserId());
		
		Profile userdto = myService.selectProfile(info.getUserId());
		Profile dto = new Profile();
		dto = myService.selectPhoto(info.getUserId());
		
		
		model.addAttribute("dto",dto);
		model.addAttribute("userdto",userdto);
		model.addAttribute("userId", info.getUserId());
		model.addAttribute("point", point);
		
		return ".mypage.list";
	}

	@PostMapping("pointCharge")
	@ResponseBody
	public Map<String, Object> insertPoint(Point dto, HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertPoint(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}

	@PostMapping("selectSeq")
	@ResponseBody
	public Map<String, Object> selectSequence() throws Exception {

		String state = "true";
		long sequence = 0;

		try {
			sequence = service.selectSeq();

		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("sequence", sequence);

		return model;
	}

	@GetMapping("selectCharge")
	@ResponseBody
	public Map<String, Object> selectCharge(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<Point> list = service.selectCharge(info.getUserId());

		if(list.isEmpty()) {
			state = "false";
		}
		

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("list", list);

		return model;
	}
	
	@GetMapping("selectAll")
	@ResponseBody
	public Map<String, Object> selectAll(HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		List<Point> listAll = service.selectAll(info.getUserId());

		if(listAll.isEmpty()) {
			state = "false";
		}
		

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		model.put("listAll", listAll);

		return model;
	}
	
	//환불 테이블에 저장하기
	@PostMapping("insertRefund")
	@ResponseBody
	public Map<String, Object> insertRefund(Point dto, HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertRefund(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	//포인트 테이블에 저장하기
	@PostMapping("refundPoint")
	@ResponseBody
	public Map<String, Object> refundPoint(Point dto, HttpSession session) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
			long seq = service.selectSeq();
			
			dto.setUserId(info.getUserId());
			dto.setPointNum(seq);
			service.refundPoint(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("insertPhoto")
    public String saveImage(Profile dto, HttpSession session, Model model) {
        String root = session.getServletContext().getRealPath("/");
        String path = root + "uploads" + File.separator + "photo";
        System.out.println("***"+path+"***");
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        try {
            dto.setUserId(info.getUserId());
            myService.insertPhoto(dto, path);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/mypage/list";
    }
	
	@GetMapping("update")
	public String nalmug(Model model) {
		
		model.addAttribute("mode","update");
		
		return "/mypage/memberUpdate";
	}
}
