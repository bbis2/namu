package com.forest.namu.domain;

public class Auction {
	private int aNum;
	private String subject;
	private String content;
	private long minBid;
	private String regDate;
	private long hitCount;
	private int state;
	private String salesStart;
	private String salesEnd;
	private String nickName;
	
	public int getaNum() {
		return aNum;
	}
	public void setaNum(int aNum) {
		this.aNum = aNum;
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
	public long getMinBid() {
		return minBid;
	}
	public void setMinBid(long minBid) {
		this.minBid = minBid;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public long getHitCount() {
		return hitCount;
	}
	public void setHitCount(long hitCount) {
		this.hitCount = hitCount;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getSalesStart() {
		return salesStart;
	}
	public void setSalesStart(String salesStart) {
		this.salesStart = salesStart;
	}
	public String getSalesEnd() {
		return salesEnd;
	}
	public void setSalesEnd(String salesEnd) {
		this.salesEnd = salesEnd;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
}
