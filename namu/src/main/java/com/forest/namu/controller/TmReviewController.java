package com.forest.namu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.domain.Summary;
import com.forest.namu.domain.TmReview;
import com.forest.namu.service.TmReviewService;

@RestController // @Controller + @ResponseBody
@RequestMapping("/tmreview/*")
public class TmReviewController {
	@Autowired
	private TmReviewService service;
	
	@Autowired
	private MyUtil myUtil;
	
	// AJAX - JSON
	@PostMapping("write")
	public Map<String, Object> writeSubmit(TmReview dto,
			HttpSession session) throws Exception {
		
		
		String state = "true";
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			
			service.insertReview(dto);
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	// AJAX - JSON
	@GetMapping("list")
	public Map<String, Object> list(
			@RequestParam long num,
			@RequestParam(defaultValue = "0") int sortNo,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("tboardNum", num);
			Summary summary = service.findByReviewSummary(map);
			
			if(summary == null) {
				return model;
			}
			
			dataCount = summary.getCount();
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("sortNo", sortNo);
			map.put("offset", offset);
			map.put("size", size);

			List<TmReview> list = service.listReview(map);
			if(info != null) {
				for(TmReview dto : list) {
					if(info.getUserId() == info.getUserId()) {
						dto.setDeletePermit(true);
					}
				}
			}
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listReview");
			
			model.put("list", list);
			model.put("summary", summary);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
		} catch (Exception e) {
		}
		
		return model;
	}
	
	// AJAX - JSON : 마이페이지 - 내가 쓴 리뷰
	@GetMapping("list2")
	public Map<String, Object> list2(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("userId", info.getUserId());
			
			dataCount = service.dataCount2(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<TmReview> list = service.listReview2(map);
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listReview");
			
			model.put("list", list);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("page", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
		} catch (Exception e) {
		}
		
		return model;
	}
	
}
