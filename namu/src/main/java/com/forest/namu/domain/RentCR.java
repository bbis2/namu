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
	private int userReview; // 사용자 리뷰 여부
	private int rentReview; // 대여 물품 리뷰 여부
	private int borrowerReview; // 제공자 리뷰 여부
	
	private String subject; // 글제목
	private String borrowName; // 대여 요청자 닉네임
	private String rentName; // 대여 제공자 닉네임
	private String rentId; // 대여 제공자 아이디
	
	private String email; // 이벤트 발생 대상 이메일
	
	// 빌려드림 후기 (rentReview)
	private long rentReviewNum;
	private String content;
	private int wasGood;	// 1-좋았음, 2-별로였음
	
	private int hasUnreadMessages; // 안읽은 메세지 수
	
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getBorrowName() {
		return borrowName;
	}
	public void setBorrowName(String borrowName) {
		this.borrowName = borrowName;
	}
	public String getRentName() {
		return rentName;
	}
	public void setRentName(String rentName) {
		this.rentName = rentName;
	}
	public String getRentId() {
		return rentId;
	}
	public void setRentId(String rentId) {
		this.rentId = rentId;
	}
	public int getUserReview() {
		return userReview;
	}
	public void setUserReview(int userReview) {
		this.userReview = userReview;
	}
	public int getRentReview() {
		return rentReview;
	}
	public void setRentReview(int rentReview) {
		this.rentReview = rentReview;
	}
	public int getBorrowerReview() {
		return borrowerReview;
	}
	public void setBorrowerReview(int borrowerReview) {
		this.borrowerReview = borrowerReview;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getHasUnreadMessages() {
		return hasUnreadMessages;
	}
	public void setHasUnreadMessages(int hasUnreadMessages) {
		this.hasUnreadMessages = hasUnreadMessages;
	}
}
