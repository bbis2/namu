package com.forest.namu.domain;


public class Alarm {
	// 알림번호
	private long alarmNum;
	// 받은사람
	private String userId;
	// 알림 내용
	private String content;
	// 보낸사람
	private String sender;
	// 보낸시간
	private String senderTime;
	// 읽은시간
	private String timeRead;
	
	// 구분(카테고리)
	private int cnum;
	// 카테고리명
	private String name;
	public long getAlarmNum() {
		return alarmNum;
	}
	public void setAlarmNum(long alarmNum) {
		this.alarmNum = alarmNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getSenderTime() {
		return senderTime;
	}
	public void setSenderTime(String senderTime) {
		this.senderTime = senderTime;
	}
	public String getTimeRead() {
		return timeRead;
	}
	public void setTimeRead(String timeRead) {
		this.timeRead = timeRead;
	}
	public int getCnum() {
		return cnum;
	}
	public void setCnum(int cnum) {
		this.cnum = cnum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
