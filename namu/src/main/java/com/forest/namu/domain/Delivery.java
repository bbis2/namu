package com.forest.namu.domain;

import org.springframework.web.multipart.MultipartFile;

public class Delivery {
	private long num;
	private String nickname;
	private String regDate;
	private long dstart;
	private String town;
	private String tableName;
	private String imageFilename1;
	private String imageFilename2;
	
	private MultipartFile selectFile1;
	private MultipartFile selectFile2;

	public MultipartFile getSelectFile1() {
		return selectFile1;
	}
	public void setSelectFile1(MultipartFile selectFile1) {
		this.selectFile1 = selectFile1;
	}
	public MultipartFile getSelectFile2() {
		return selectFile2;
	}
	public void setSelectFile2(MultipartFile selectFile2) {
		this.selectFile2 = selectFile2;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public long getState() {
		return state;
	}
	public void setState(long state) {
		this.state = state;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}
	public String getSaddr() {
		return saddr;
	}
	public void setSaddr(String saddr) {
		this.saddr = saddr;
	}
	public String getSaddr2() {
		return saddr2;
	}
	public void setSaddr2(String saddr2) {
		this.saddr2 = saddr2;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public String getReceive2() {
		return receive2;
	}
	public void setReceive2(String receive2) {
		this.receive2 = receive2;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getHitCount() {
		return hitCount;
	}
	public void setHitCount(long hitCount) {
		this.hitCount = hitCount;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public long getUsermanner() {
		return usermanner;
	}
	public void setUsermanner(long usermanner) {
		this.usermanner = usermanner;
	}
	public long getDstart() {
		return dstart;
	}
	public void setDstart(long dstart) {
		this.dstart = dstart;
	}
	public long getNum2() {
		return num2;
	}
	public void setNum2(long num2) {
		this.num2 = num2;
	}
	public String getImageFilename2() {
		return imageFilename2;
	}
	public void setImageFilename2(String imageFilename2) {
		this.imageFilename2 = imageFilename2;
	}
	public String getImageFilename1() {
		return imageFilename1;
	}
	public void setImageFilename1(String imageFilename1) {
		this.imageFilename1 = imageFilename1;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	private long state;
	private String content;
	private String subject;
	private long point;
	private String saddr;
	private String saddr2;
	private String receive;
	private String receive2;
	private String userId;
	private long hitCount;
	private long usermanner;
	private String sdate;
	private String stime;
	private String author;
	private long num2;
	
}
