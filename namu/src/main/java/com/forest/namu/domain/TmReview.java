package com.forest.namu.domain;


public class TmReview {
	private long num;
	private String userId;
	private String nickName;
	private int score;
	private String review;
	private String answer;
	private long tboardNum;
	private String reviewDate;
	private String answerDate;
	private boolean deletePermit;
	private int showReview;
	private int locked;
	
	private String productName;
	private String optionValue;
	private String optionValue2;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}


	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public long getTboardNum() {
		return tboardNum;
	}
	public void setTboardNum(long tboardNum) {
		this.tboardNum = tboardNum;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public boolean isDeletePermit() {
		return deletePermit;
	}
	public void setDeletePermit(boolean deletePermit) {
		this.deletePermit = deletePermit;
	}
	public int getShowReview() {
		return showReview;
	}
	public void setShowReview(int showReview) {
		this.showReview = showReview;
	}
	public int getLocked() {
		return locked;
	}
	public void setLocked(int locked) {
		this.locked = locked;
	}
	
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
	public String getOptionValue2() {
		return optionValue2;
	}
	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}
}
