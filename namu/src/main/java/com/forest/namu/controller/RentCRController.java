package com.forest.namu.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.forest.namu.domain.Rent;
import com.forest.namu.domain.RentCR;
import com.forest.namu.domain.SessionInfo;
import com.forest.namu.service.RentCRService;
import com.forest.namu.service.RentService;

@Controller
@RequestMapping("/rentcr/*")
public class RentCRController {

	@Autowired
	private RentCRService cRservice;
	
	@Autowired
	private RentService service;
	
	@PostMapping("rentConfirm")
    @ResponseBody
    public Map<String, Object> rentConfirm(
            @RequestParam String strDate,
            @RequestParam String endDate,
            @RequestParam long rentNum,
            @RequestParam int deposit,
            @RequestParam int totalPrice,
            HttpSession session) {

        Map<String, Object> result = new HashMap<>();
        SessionInfo sessionInfo = (SessionInfo) session.getAttribute("member");

        try {
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
            Rent rent = service.findById(rentNum);
            if (rent == null) {
                throw new IllegalArgumentException("Rent item not found");
            }

            // 4. 사용자 포인트 확인
            if (sessionInfo.getPoint() < deposit) {
                throw new IllegalArgumentException("Insufficient points");
            }

            // 5. 대여 신청 처리
            RentCR dto = new RentCR();
            dto.setRentNum(rentNum);
            dto.setUserId(sessionInfo.getUserId());
            dto.setStrDate(strDate);
            dto.setEndDate(endDate);
            dto.setDeposit(deposit);
            dto.setTotalPrice(totalPrice);
            dto.setAgree(1); // 약관 동의 (클라이언트에서 체크했다고 가정)
            dto.setState(1); // 신청완료(대기중) 상태
            
            cRservice.insertRentConfirm(dto);

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
	
}
