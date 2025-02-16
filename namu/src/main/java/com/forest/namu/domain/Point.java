package com.forest.namu.domain;

public class Point {
	private long pointNum;
	private String description;
	private String regDate;
	private long currentPoint;
	private long pointVar;
	private long pointCate;
	private String userId;
	private long lastMoney;
	
	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}
	// 환불테이블 용도
	private long point;
	private long merchant_id;
	
	public long getMerchant_id() {
		return merchant_id;
	}
	public void setMerchant_id(long merchant_id) {
		this.merchant_id = merchant_id;
	}
	public long getLastMoney() {
		return lastMoney;
	}
	public void setLastMoney(long lastMoney) {
		this.lastMoney = lastMoney;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getPointNum() {
		return pointNum;
	}
	public void setPointNum(long pointNum) {
		this.pointNum = pointNum;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public long getCurrentPoint() {
		return currentPoint;
	}
	public void setCurrentPoint(long currentPoint) {
		this.currentPoint = currentPoint;
	}
	public long getPointVar() {
		return pointVar;
	}
	public void setPointVar(long pointVar) {
		this.pointVar = pointVar;
	}
	public long getPointCate() {
		return pointCate;
	}
	public void setPointCate(long pointCate) {
		this.pointCate = pointCate;
	}
	
	
}
