package com.forest.namu.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Used {
	private long num;
	private String subject;
	private String content;
	private long price;
	private String regDate;
	private long hitCount;
	private int state;
	private String userId;
	private String nickName;
	
	private MultipartFile thumbFile;
	private String imageFile;
	
	private List <MultipartFile> selectFile;
	private String uploadFile;
	private long fileNum;
	
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
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
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public MultipartFile getThumbFile() {
		return thumbFile;
	}
	public void setThumbFile(MultipartFile thumbFile) {
		this.thumbFile = thumbFile;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}
	public String getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	
	
}
