package com.forest.namu.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Borrow {
	
	// 빌림 테이블 (borrow)
	private long num;
	private String userId;
	private String subject;
	private int price;
	private String strDate;
	private String endDate;
	private String content; // 설명글
	private String regDate;
	private int hitCount;
	private String location;
	private int categoryNum;

	// 카테고리 테이블 (rbCategory)
	private String category;
	
	// 이미지 테이블 (rbImage)
	private long imageNum;
	private List<MultipartFile> image; // 사진
	private String imageFilename;
	
	
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
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getStrDate() {
		return strDate;
	}
	public void setStrDate(String strDate) {
		this.strDate = strDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public int getCategoryNum() {
		return categoryNum;
	}
	public void setCategoryNum(int categoryNum) {
		this.categoryNum = categoryNum;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public List<MultipartFile> getImage() {
		return image;
	}
	public void setImage(List<MultipartFile> image) {
		this.image = image;
	}
	public long getImageNum() {
		return imageNum;
	}
	public void setImageNum(long imageNum) {
		this.imageNum = imageNum;
	}
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
}
