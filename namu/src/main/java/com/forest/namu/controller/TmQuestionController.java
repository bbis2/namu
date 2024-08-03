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
import com.forest.namu.domain.TmQuestion;
import com.forest.namu.service.TmQuestionService;


@RestController // @Controller + @ResponseBody
@RequestMapping("/tmqna/*")
public class TmQuestionController {
	@Autowired
	private TmQuestionService service;
	
	@Autowired
	private MyUtil myUtil;
	
	// AJAX - JSON
	@PostMapping("write")
	public Map<String, Object> writeSubmit(TmQuestion dto,
			HttpSession session) throws Exception {
		
		String state = "true";
		try {
			
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			
			service.insertQuestion(dto);
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
			@RequestParam long tboardNum,
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("tboardNum", tboardNum);
			
			dataCount = service.dataCount(map);
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);

			List<TmQuestion> list = service.listQuestion(map);
			for(TmQuestion dto : list) {
				if(dto.getSecret() == 1 && (info == null || (info.getMembership() < 50 && dto.getUserId() != info.getUserId()))) {
					dto.setQuestion("비밀글 입니다. <i class='bi bi-file-lock2'></i>");
					dto.setAnswer("");
				}
			}
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listQuestion");
			
			model.put("list", list);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
		} catch (Exception e) {
		}
		
		return model;
	}

	// AJAX - JSON : 마이페이지 - 내 Q&A
	@GetMapping("list2")
	public Map<String, Object> list2(
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
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

			List<TmQuestion> list = service.listQuestion3(map);
			
			String paging = myUtil.pagingFunc(current_page, total_page, "listQuestion");
			
			model.put("list", list);
			model.put("dataCount", dataCount);
			model.put("size", size);
			model.put("pageNo", current_page);
			model.put("paging", paging);
			model.put("total_page", total_page);
			
		} catch (Exception e) {
		}
		
		return model;
	}
	
	  // AJAX - JSON : 질문 삭제
    @PostMapping("delete")
    public Map<String, Object> deleteQuestion(@RequestParam long num, HttpSession session) {
        String state = "true";
        String message = "삭제 성공"; // 성공 시의 메시지
        List<TmQuestion> list = null;
        int dataCount = 0;
        int total_page = 0;
        int current_page = 1; // 기본 페이지는 1로 설정

        try {
            SessionInfo info = (SessionInfo) session.getAttribute("member");
            if (info == null) {
                state = "false";
                message = "로그인 정보가 없습니다.";
                throw new Exception(message);
            }

            // 질문 삭제 서비스 호출
            service.deleteQuestion(num);

            // 질문 삭제 후 최신 질문 목록을 다시 가져옴
            Map<String, Object> map = new HashMap<>();
            map.put("userId", info.getUserId());

            dataCount = service.dataCount2(map);
            total_page = myUtil.pageCount(dataCount, 5); // 5는 한 페이지당 질문 수
            if (current_page > total_page) {
                current_page = total_page;
            }

            int offset = (current_page - 1) * 5;
            if(offset < 0) offset = 0;

            map.put("offset", offset);
            map.put("size", 5);

            list = service.listQuestion2(map);

        } catch (Exception e) {
            state = "false";
            message = e.getMessage();
            e.printStackTrace();
        }

        Map<String, Object> model = new HashMap<>();
        model.put("state", state);
        model.put("message", message);
        model.put("list", list);
        model.put("dataCount", dataCount);
        model.put("total_page", total_page);
        model.put("current_page", current_page);
        return model;
    }


}
