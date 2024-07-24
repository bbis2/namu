package com.forest.namu.domain;

public class TogetherApply {
	
	private long tNum;
	private String userId;
	private String applyDate;
	private String content;
	private String acceptance;
	private String nickName;
	
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
	public String getAcceptance() {
		return acceptance;
	}
	public void setAcceptance(String acceptance) {
		this.acceptance = acceptance;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	
}
