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
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.namu.common.FileManager;
import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Point;
import com.forest.namu.domain.Rider;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.DeliveryService;
import com.forest.namu.service.PointService;

@Controller
@RequestMapping("/delivery/*")
public class DelieveryController {

	@Autowired
	private DeliveryService dService;
	
	@Autowired
	private PointService pService;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String list(
			@RequestParam(value = "town", required = false)String town,
			@RequestParam(value="page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		
		if (town == null || town.isEmpty()) {
            SessionInfo info = (SessionInfo) session.getAttribute("member");
            if (info != null) {
                town = info.getTown1(); 
            }
        }
		
		int size = 10;
		int total_page = 0;
		int dataCount= 0;
		
		if(req.getMethod().equals("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");	
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("town", town);
		
		dataCount = dService.dataCount(map);
		if(dataCount != 0) {
			total_page = dataCount / size + (dataCount % size > 0 ? 1 : 0);
		}
		
		// 다른 사람이 자료를 삭제하여 전체 페이지수가 변화 된 경우
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page -1) * size;
		if(offset <0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		map.put("size", size);  // 왜 두개...? 이유가 궁금합니다! 
		
		// 글 리스트 
		List<Delivery> list = dService.listDelivery(map);

		String query = "";
		String cp = req.getContextPath();
		String listUrl;
		String articleUrl;
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + 
					URLEncoder.encode(kwd,"utf-8");
		}
		
		listUrl = cp + "/delivery/list";
		articleUrl= cp + "/delivery/article?page="+ current_page;
		if(query.length() != 0 ) {
			listUrl += "?" + query;
			articleUrl += "&" + query;
		}
		
		System.out.println("articleUrl:"+articleUrl);
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("total_page", total_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("paging", paging);
		model.addAttribute("size", size);
		model.addAttribute("town", town);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
				
		return ".delivery.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {
		model.addAttribute("mode", "write");
		return ".delivery.write";
	}
	
	@PostMapping("write")
	public String insertDelivery(Delivery dto,
			HttpSession session)throws Exception{
		
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		dto.setUserId(info.getUserId());
		
		try {
			dService.insertDelivery(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/delivery/list";
	}
	
	@PostMapping("pointCheck")
	@ResponseBody
	public Map<String, Object> isPoint(Delivery dto, HttpSession session,@RequestParam long inputPoint) throws Exception {

		String state = "true";
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			long saveMoney = dService.selectPoint(info.getUserId());
			
			if(saveMoney<inputPoint) {
				state = "false";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@PostMapping("pointMinus")
	@ResponseBody
	public Map<String, Object> pointMinus(HttpSession session, @RequestParam long inputPoint) throws Exception {

	    String state = "true";
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    Point dto = new Point(); // DTO를 초기화합니다.

	    try {
	        long saveMoney = dService.selectPoint(info.getUserId());
	        long seq = pService.selectSeq();
	        
	        dto.setPointNum(seq);
	        dto.setUserId(info.getUserId());
	        dto.setPointVar(inputPoint);
	        dto.setCurrentPoint(saveMoney);
	        pService.pointMinus(dto);
	    } catch (Exception e) {
	        state = "false";
	        e.printStackTrace();
	    }
	    
	    Map<String, Object> model = new HashMap<String, Object>();
	    model.put("state", state);
	    return model;
	}

	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Delivery dto2,
			Model model)throws Exception{
		
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dService.updateHitCount(num);
		
		Delivery dto = dService.findById(num);
		
		dto2.setNum2(num);
		dto2.setUserId(info.getUserId());

		long dstart = dService.findAutowired(dto2);
		long count = dService.countOk(dto2);
		if (dto == null) {
			return "redirect:/delivery/list?" + query;
		}
		
		dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);

		Delivery prevDto = dService.findByPrev(map);
		Delivery nextDto = dService.findByNext(map);
		
		
		model.addAttribute("count",count);
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("dstart",dstart);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		
		return ".delivery.article";
	}
	
	@PostMapping("answer")
	public String answerSubmit(
			@RequestParam long num,
			HttpSession session,
			Delivery dto
			)throws Exception {
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "delivery";
		try {
			
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dto.setUserId(info.getUserId());
			dto.setNum(num);
			dService.updateAuthor(dto,path);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/delivery/list";
	}
	
	@PostMapping("application")
	public String riderUpdate(
			Rider dto,
			Delivery dDto,
			@RequestParam String time,
			@RequestParam String date,
			@RequestParam Long num2,
			HttpSession session
			)throws Exception {
		
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			dDto.setStime(time);
			dDto.setNum(num2);
			dDto.setSdate(date);
			
			dto.setUserId(info.getUserId());
			dto.setNum2(num2);
		
			
			dService.insertRider(dto);
			dService.updateDelivery(dDto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/delivery/list";
	}
	
	@PostMapping("whoRider")
	@ResponseBody
	public Map<String, Object> selectRider(@RequestParam long num, 
			@RequestParam boolean userLiked,
			HttpSession session) {
		
		
			return null;
	}
	
}
