package com.forest.namu.domain;

public class Daily {
	private long num;
	private String userId;
	private String subject;
	private String content;
	private String regDate;
	private int hitCount;
	private int notice;
	private String nickName;
	private String town1;

	private long categoryNum;
	private String categoryName;
	
	private int replyCount;
	private int dailyLikeCount;
	
	
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public int getNotice() {
		return notice;
	}
	public void setNotice(int notice) {
		this.notice = notice;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getTown1() {
		return town1;
	}
	public void setTown1(String town1) {
		this.town1 = town1;
	}
	public long getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(long categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}
	public int getDailyLikeCount() {
		return dailyLikeCount;
	}
	public void setDailyLikeCount(int dailyLikeCount) {
		this.dailyLikeCount = dailyLikeCount;
	}
	
	
	
	
	
	
}
