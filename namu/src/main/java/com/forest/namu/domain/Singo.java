package com.forest.namu.domain;

public class Singo {
	private long reportNum;
	private long postNum;
	private String Field;
	private String reportDate;
	private String reportType;
	private String reportContent;
	private String processResult;
	private String userId;
	private String banUser;
	private String subject;
	
	
	
	public long getReportNum() {
		return reportNum;
	}
	public void setReportNum(long reportNum) {
		this.reportNum = reportNum;
	}
	public long getPostNum() {
		return postNum;
	}
	public void setPostNum(long postNum) {
		this.postNum = postNum;
	}
	
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public String getReportType() {
		return reportType;
	}
	public void setReportType(String reportType) {
		this.reportType = reportType;
	}
	public String getReportContent() {
		return reportContent;
	}
	public void setReportContent(String reportContent) {
		this.reportContent = reportContent;
	}
	public String getProcessResult() {
		return processResult;
	}
	public void setProcessResult(String processResult) {
		this.processResult = processResult;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getField() {
		return Field;
	}
	public void setField(String field) {
		Field = field;
	}
	public String getBanUser() {
		return banUser;
	}
	public void setBanUser(String banUser) {
		this.banUser = banUser;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
}
