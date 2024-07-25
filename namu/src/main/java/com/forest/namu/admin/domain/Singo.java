package com.forest.namu.admin.domain;

public class Singo {
	private long reportNum;
	private long postNum;
	private String field;
	private String reportDate;
	private String reportType;
	private String reportContent;
	private long processresult;
	private String userId;
	private String banUser;
	private String subject;
	private String banDate;
	private String resulttype;
	
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

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	
	public String getBanDate() {
		return banDate;
	}
	public void setBanDate(String banDate) {
		this.banDate = banDate;
	}
	public long getProcessresult() {
		return processresult;
	}
	public void setProcessresult(long processresult) {
		this.processresult = processresult;
	}
	public String getResulttype() {
		return resulttype;
	}
	public void setResulttype(String resulttype) {
		this.resulttype = resulttype;
	}

}
