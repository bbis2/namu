package com.forest.namu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Alarm;
import com.forest.namu.domain.Point;
import com.forest.namu.domain.Rent;
import com.forest.namu.domain.RentCR;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.mail.MailService;
import com.forest.namu.service.AlarmService;
import com.forest.namu.service.PointService;
import com.forest.namu.service.RentCRService;
import com.forest.namu.service.RentService;

@Controller
@RequestMapping("/rentcr/*")
public class RentCRController {

	@Autowired
	private RentCRService crService;
	
	@Autowired
	private RentService rentService;
	
	@Autowired
	private PointService pService;
	
    @Autowired
    private MailService mailService;
    
    @Autowired
	private AlarmService alarmService;	
	
	@Autowired
	private MyUtil myUtil;
	
    @GetMapping("list")
    public String list(HttpSession session, Model model) throws Exception {
        SessionInfo info = (SessionInfo) session.getAttribute("member");
        String userId = info.getUserId();
        
        List<RentCR> myApplications = crService.getMyApplications(userId);
        for(RentCR dto : myApplications) {
        	dto.setUserId(userId);
        	dto.setStrDate(myUtil.convertDateFormat(dto.getStrDate()));
        	dto.setEndDate(myUtil.convertDateFormat(dto.getEndDate()));
        }
        List<RentCR> receivedRequests = crService.getReceivedRequests(userId);
        for(RentCR dto : receivedRequests) {
        	dto.setUserId(userId);
        	dto.setStrDate(myUtil.convertDateFormat(dto.getStrDate()));
        	dto.setEndDate(myUtil.convertDateFormat(dto.getEndDate()));
        }

        model.addAttribute("myApplications", myApplications);
        model.addAttribute("receivedRequests", receivedRequests);

        return ".rent.crlist";
    }
	
	@PostMapping("rentConfirm")
    @ResponseBody
    public Map<String, Object> rentConfirm(
            @RequestParam String strDate,
            @RequestParam String endDate,
            @RequestParam long rentNum,
            @RequestParam int deposit,
            @RequestParam int totalPrice,
            HttpServletRequest req,
            HttpSession session) {

		Map<String, Object> result = new HashMap<>();
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		try {
	        
	        long currentPoint = pService.selectPoint(info.getUserId());

            // 1. 서버 측 유효성 검사
            if (strDate == null || endDate == null || rentNum <= 0 || deposit <= 0 || totalPrice <= 0) {
                throw new IllegalArgumentException("Invalid input parameters");
            }

            // 2. 날짜 형식 및 유효성 검사
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            Date startDateTime = sdf.parse(strDate);
            Date endDateTime = sdf.parse(endDate);

            if (startDateTime.after(endDateTime) || startDateTime.before(new Date())) {
                throw new IllegalArgumentException("Invalid date range");
            }

            // 3. 대여 물품 존재 여부 및 상태 확인
            Rent rent = rentService.findById(rentNum);
            if (rent == null) {
                throw new IllegalArgumentException("Rent item not found");
            }

            // 4. 사용자 포인트 확인
            if (currentPoint < deposit) {
                throw new IllegalArgumentException("Insufficient points");
            }
            
            // 보증금 납입
            Point point = new Point();
            point.setUserId(info.getUserId());
            point.setCurrentPoint(currentPoint);
            point.setPointVar(deposit);
            
            // 5. 대여 신청 처리
            RentCR dto = new RentCR();
            dto.setRentNum(rentNum);
            dto.setUserId(info.getUserId());
            dto.setBorrowName(info.getNickName());
            dto.setStrDate(strDate);
            dto.setEndDate(endDate);
            dto.setDeposit(deposit);
            dto.setTotalPrice(totalPrice);
            dto.setAgree(1); // 약관 동의 (클라이언트에서 체크했다고 가정)
            dto.setState(1); // 신청완료(대기중) 상태
            
            crService.insertRentConfirm(dto, point);
            
            // 6. 메일 발송
    		Map<String, Object> map = crService.getEmailByRentNum(rentNum);
    		dto.setEmail((String)map.get("EMAIL"));
    		dto.setSubject((String)map.get("SUBJECT"));
            dto.getStrDate().replaceAll("T", " ");
            dto.getEndDate().replaceAll("T", " ");
            mailService.sendRentRequestMail(dto);
            
            // 7. 알람
			String url = req.getContextPath() + "/rentcr/list";
            Alarm alarm = new Alarm();
            alarm.setCnum(2);
            alarm.setContent("새로운 대여 신청이 접수되었습니다. <a href='" + url + "'> 눌러서 신청 관리 바로가기</a>");
            alarm.setUserId((String)map.get("USERID"));
            alarm.setSender("admin");
            alarmService.insertAlarm(alarm);

            result.put("state", "success");
            
        } catch (IllegalArgumentException e) {
            result.put("state", "error");
            result.put("message", e.getMessage());
        } catch (Exception e) {
            result.put("state", "error");
            result.put("message", "An unexpected error occurred");
            e.printStackTrace();
        }

        return result;
    }
	
	@PostMapping("checkOverlap")
	@ResponseBody
	public Map<String, Object> checkOverlap(
	        @RequestParam String strDate,
	        @RequestParam String endDate,
	        @RequestParam long rentNum) {
	    Map<String, Object> result = new HashMap<>();
	    try {
	    	Map<String, Object> map = new HashMap<>();
	    	
	    	map.put("strDate", strDate);
	    	map.put("endDate", endDate);
	    	map.put("rentNum", rentNum);
	    	
	        boolean overlap = crService.checkRentOverlap(map);
	        
	        result.put("overlap", overlap);
	        
	    } catch (Exception e) {
	        result.put("error", e.getMessage());
	    }
	    return result;
	}

	
	@PostMapping("cancelRent")
	@ResponseBody
	public Map<String, Object> cancelRent(
	        @RequestParam long rentNum,
	        HttpServletRequest req,
	        HttpSession session) {
	    Map<String, Object> result = new HashMap<>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	    	Map<String, Object> map = new HashMap<>();
	    	map.put("rentNum", rentNum);
	    	map.put("userId", info.getUserId());
	    	
	    	long currentPoint = pService.selectPoint(info.getUserId());
	    	Point point = new Point();
	    	point.setCurrentPoint(currentPoint);
	    	point.setUserId(info.getUserId());
	    	
	        crService.cancelRent(map, point);
	        
	        RentCR dto = crService.findByRentNum(map);
    		map = crService.getEmailByRentNum(rentNum);
    		dto.setEmail((String)map.get("EMAIL"));
    		dto.setSubject((String)map.get("SUBJECT"));
    		dto.setBorrowName(info.getNickName());
    		mailService.sendRentCancelMail(dto);
    		
            // 7. 알람
			String url = req.getContextPath() + "/rentcr/list";
            Alarm alarm = new Alarm();
            alarm.setCnum(2);
            alarm.setContent("대여 신청이 취소되었습니다. <a href='" + url + "'> 눌러서 신청 관리 바로가기</a>");
            alarm.setUserId((String)map.get("USERID"));
            alarm.setSender("admin");
            alarmService.insertAlarm(alarm);
	        
	        result.put("state", "success");
	        
	    } catch (Exception e) {
	        result.put("state", "error");
	        result.put("message", e.getMessage());
	    }
	    return result;
	}
	
	@PostMapping("accept")
	@ResponseBody
	public Map<String, Object> acceptRentRequest(
	        @RequestParam long reqNum,
	        HttpServletRequest req,
	        HttpSession session) {
	    Map<String, Object> result = new HashMap<>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	        Map<String, Object> map = new HashMap<>();
	        map.put("reqNum", reqNum);
	        map.put("userId", info.getUserId());
	        
	        crService.acceptRentRequest(map);
	        
	        RentCR dto = crService.findByReqNum(reqNum);
    		map = crService.getEmailByReqNum(reqNum);
    		dto.setEmail((String)map.get("EMAIL"));
    		dto.setSubject((String)map.get("SUBJECT"));
    		dto.setRentName(info.getNickName());
	        mailService.sendRentAcceptMail(dto);
	        
            // 7. 알람
			String url = req.getContextPath() + "/rentcr/list";
            Alarm alarm = new Alarm();
            alarm.setCnum(2);
            alarm.setContent("대여 신청이 수락되었습니다. <a href='" + url + "'> 눌러서 신청 관리 바로가기</a>");
            alarm.setUserId((String)map.get("BORROWID"));
            alarm.setSender("admin");
            alarmService.insertAlarm(alarm);
	        
	        result.put("state", "success");
	        result.put("message", "신청이 수락되었습니다.");
	        
	    } catch (Exception e) {
	        result.put("state", "error");
	        result.put("message", "수락 처리 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return result;
	}
	
	@PostMapping("reject")
	@ResponseBody
	public Map<String, Object> rejectRentRequest(
	        @RequestParam long reqNum,
	        @RequestParam String rejectReason,
	        HttpServletRequest req,
	        HttpSession session) {
	    Map<String, Object> result = new HashMap<>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	        Map<String, Object> map = new HashMap<>();
	        map.put("reqNum", reqNum);
	        map.put("reject", rejectReason);
	        map.put("userId", info.getUserId());
	        
	        crService.rejectRentRequest(map);
	        
	        RentCR dto = crService.findByReqNum(reqNum);
    		map = crService.getEmailByReqNum(reqNum);
    		dto.setEmail((String)map.get("EMAIL"));
    		dto.setSubject((String)map.get("SUBJECT"));
    		dto.setRentName(info.getNickName());
	        mailService.sendRentRejectMail(dto, rejectReason);
	        
            // 7. 알람
			String url = req.getContextPath() + "/rentcr/list";
            Alarm alarm = new Alarm();
            alarm.setCnum(2);
            alarm.setContent("대여 신청이 거절되었습니다. <a href='" + url + "'> 눌러서 신청 관리 바로가기</a>");
            alarm.setUserId((String)map.get("BORROWID"));
            alarm.setSender("admin");
            alarmService.insertAlarm(alarm);
	        
	        result.put("state", "success");
	        result.put("message", "신청이 거절되었습니다.");
	        
	    } catch (Exception e) {
	        result.put("state", "error");
	        result.put("message", "거절 처리 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return result;
	}
	
	@PostMapping("finishRent")
	@ResponseBody
	public Map<String, Object> finishRentRequest(
	        @RequestParam long reqNum,
	        HttpServletRequest req,
	        HttpSession session) {
	    Map<String, Object> result = new HashMap<>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	        Map<String, Object> map = new HashMap<>();
	        map.put("reqNum", reqNum);
	        map.put("userId", info.getUserId());
	        
	        crService.finishRentRequest(map);
	        
	        RentCR dto = crService.findByReqNum(reqNum);
    		map = crService.getEmailByReqNum(reqNum);
    		dto.setEmail((String)map.get("EMAIL"));
    		dto.setSubject((String)map.get("SUBJECT"));
    		dto.setRentName(info.getNickName());
	        mailService.sendRentCompleteMail(dto);
	        
            // 7. 알람
			String url = req.getContextPath() + "/rentcr/list";
            Alarm alarm = new Alarm();
            alarm.setCnum(2);
            alarm.setContent("대여가 완료되었습니다. 보증금이 반환되었습니다. <a href='" + url + "'> 눌러서 신청 관리 바로가기</a>");
            alarm.setUserId((String)map.get("BORROWID"));
            alarm.setSender("admin");
            alarmService.insertAlarm(alarm);
	        
	        result.put("state", "success");
	        result.put("message", "대여가 완료되었습니다. 보증금이 반환되었습니다.");
	        
	    } catch (Exception e) {
	        result.put("state", "error");
	        result.put("message", "완료 처리 중 오류가 발생했습니다.");
	        e.printStackTrace();
	    }
	    return result;
	}
	
	@GetMapping("reviews")
	@ResponseBody
	public Map<String, Object> getReviews(@RequestParam long rentNum, @RequestParam(defaultValue = "1") int page) throws Exception {
	    int pageSize = 5; // 한 페이지에 표시할 후기 수
	    Map<String, Object> result = new HashMap<>();
	    
	    try {
	    	List<Map<String, Object>> reviews = crService.getRentReviews(rentNum, page, pageSize);
	    	int totalReviews = crService.getRentReviewCount(rentNum);
	    	
	    	result.put("reviews", reviews);
	    	result.put("currentPage", page);
	    	result.put("totalPages", (totalReviews + pageSize - 1) / pageSize);
	    	
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	    return result;
	}
	
	@GetMapping("reviewCount")
	@ResponseBody
	public Map<String, Integer> getReviewCount(@RequestParam long rentNum) throws Exception {
		Map<String, Integer> map = null;
		try {
			
			int count = crService.getRentReviewCount(rentNum);
			map = new HashMap<>();
			map.put("count", count);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	    return map;
	}
	
	@PostMapping("submitUserReview")
	@ResponseBody
	public Map<String, Object> submitUserReview(
	        @RequestParam Map<String, String> reviewData,
	        HttpSession session) {
	    Map<String, Object> result = new HashMap<>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	        reviewData.put("userId", info.getUserId());
	        crService.submitUserReview(reviewData);
	        
	        result.put("state", "success");
	        result.put("message", "사용자 후기가 성공적으로 제출되었습니다.");
	    } catch (Exception e) {
	        result.put("state", "error");
	        result.put("message", e.getMessage());
	    }
	    return result;
	}

	@PostMapping("submitRentReview")
	@ResponseBody
	public Map<String, Object> submitRentReview(
	        @RequestParam Map<String, String> reviewData,
	        HttpSession session) {
	    Map<String, Object> result = new HashMap<>();
	    SessionInfo info = (SessionInfo) session.getAttribute("member");
	    
	    try {
	        reviewData.put("userId", info.getUserId());
	        crService.submitRentReview(reviewData);
	        
	        result.put("state", "success");
	        result.put("message", "대여 물품 후기가 성공적으로 제출되었습니다.");
	    } catch (Exception e) {
	        result.put("state", "error");
	        result.put("message", e.getMessage());
	    }
	    return result;
	}
	
}
