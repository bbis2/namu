package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Point;
import com.forest.namu.domain.RentCR;

public interface RentCRService {

	public boolean checkRentOverlap(Map<String, Object> map) throws Exception; 		// 대여 기간 중복 확인
	public void insertRentConfirm(RentCR dto, Point point) throws Exception; 		// 렌트 신청 삽입
	public void cancelRent(Map<String, Object> map, Point point) throws Exception; 	// 렌트 신청 취소
	public RentCR checkState(Map<String, Object> map) throws Exception; 			// 렌트 상태 확인
	
    public List<RentCR> getMyApplications(String userId) throws Exception; 			// 보낸 신청 가져오기
    public List<RentCR> getReceivedRequests(String userId) throws Exception; 		// 받은 신청 가져오기
    
	public void rejectRentRequest(Map<String, Object> map) throws Exception; // 받은 신청 거절하기

}