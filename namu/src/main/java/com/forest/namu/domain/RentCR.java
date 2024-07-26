package com.forest.namu.domain;

public class RentCR {

	// 빌려드림 예약신청 (rentConfirm 테이블)
	private long reqNum;
	private long rentNum; 	// 빌려드림 글번호
	private String userId;	// 신청자 아이디
	private String reqDate; // 신청일자
	private String strDate; // 대여시작일자
	private String endDate; // 대여종료일자
	private int agree; 		// 약관 동의 여부(0: 미동의, 1: 동의)
	private int deposit;	// 보증금
	private int state;		// 신청 상태 (1-신청완료(대기중), 2-수락, 3-거절, 4-취소, 5-완료)
	private String reject; 	// 거절사유
	private int totalPrice; // 총 금액
	
	// 빌려드림 후기 (rentReview)
	private long rentReviewNum;
	private String content;
	private int wasGood;	// 1-좋았음, 2-별로였음
	
	
	public long getReqNum() {
		return reqNum;
	}
	public void setReqNum(long reqNum) {
		this.reqNum = reqNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getReqDate() {
		return reqDate;
	}
	public void setReqDate(String reqDate) {
		this.reqDate = reqDate;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getAgree() {
		return agree;
	}
	public void setAgree(int agree) {
		this.agree = agree;
	}
	public int getDeposit() {
		return deposit;
	}
	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getReject() {
		return reject;
	}
	public void setReject(String reject) {
		this.reject = reject;
	}
	public long getRentReviewNum() {
		return rentReviewNum;
	}
	public void setRentReviewNum(long rentReviewNum) {
		this.rentReviewNum = rentReviewNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getWasGood() {
		return wasGood;
	}
	public void setWasGood(int wasGood) {
		this.wasGood = wasGood;
	}
	public long getRentNum() {
		return rentNum;
	}
	public void setRentNum(long rentNum) {
		this.rentNum = rentNum;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
}
