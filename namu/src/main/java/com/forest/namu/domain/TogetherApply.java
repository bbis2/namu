package com.forest.namu.domain;

public class TogetherApply {
	
	private long tNum;
	private String userId;
	private String applyDate;
	private String content;
	private int userApply; // 참여 여부
	private String acceptance;
	
	public long gettNum() {
		return tNum;
	}
	public void settNum(long tNum) {
		this.tNum = tNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getApplyDate() {
		return applyDate;
	}
	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getUserApply() {
		return userApply;
	}
	public void setUserApply(int userApply) {
		this.userApply = userApply;
	}
	public String getAcceptance() {
		return acceptance;
	}
	public void setAcceptance(String acceptance) {
		this.acceptance = acceptance;
	}
	
	
}
