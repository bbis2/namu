package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Point;
import com.forest.namu.domain.RentCR;

public interface RentCRService {
	public RentCR findByReqNum(Long reqNum);
	public RentCR findByRentNum(Map<String, Object> map);

	public boolean checkRentOverlap(Map<String, Object> map) throws Exception; 		// 대여 기간 중복 확인
	public void insertRentConfirm(RentCR dto, Point point) throws Exception; 		// 렌트 신청 삽입
	public void cancelRent(Map<String, Object> map, Point point) throws Exception; 	// 렌트 신청 취소
	public RentCR checkState(Map<String, Object> map) throws Exception; 			// 렌트 상태 확인
	
    public List<RentCR> getMyApplications(String userId) throws Exception; 			// 보낸 신청 가져오기
    public List<RentCR> getReceivedRequests(String userId) throws Exception; 		// 받은 신청 가져오기
    
    public void acceptRentRequest(Map<String, Object> map) throws Exception; // 신청 수락하기
	public void rejectRentRequest(Map<String, Object> map) throws Exception; // 받은 신청 거절하기
	public void finishRentRequest(Map<String, Object> map) throws Exception; // 대여 완료

	public void submitUserReview(Map<String, String> reviewData) throws Exception; // 사용자 후기
	public void submitRentReview(Map<String, String> reviewData) throws Exception; // 대여 물품 후기
	
    public int getRentReviewCount(long rentNum) throws Exception; // 리뷰 개수 불러오기
	public List<Map<String, Object>> getRentReviews(long rentNum, int page, int pageSize) throws Exception; // 리뷰 불러오기 (article)
	
	public Map<String, Object> getEmailByRentNum(long rentNum) throws Exception; // 글쓴이 이메일 가져오기
	public Map<String, Object> getEmailByReqNum(long reqNum) throws Exception; // 신청자 이메일 가져오기
}