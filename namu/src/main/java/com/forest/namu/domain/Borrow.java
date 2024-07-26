package com.forest.namu.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Borrow {
	
	// 빌림 테이블 (borrow)
	private long borrowNum;
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
	private String tableName;
	
	// member join해서 가져오는 데이터
	private String nickName;
	
	// 지난 시간(초)
	private String passedTime;
	
	// 카테고리 테이블 (rbCategory)
	private String category;
	
	// 이미지 테이블 (rbImage)
	private long imageNum;
	private List<MultipartFile> image; // 사진
	private String imageFilename;
	
	// 찜 여부
	private boolean userLiked;
	
	// 찜 개수
	private int likeCount;
	
	// 작성자 프로필 사진
	private String profile;
	
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getPassedTime() {
		return passedTime;
	}
	public void setPassedTime(String passedTime) {
		this.passedTime = passedTime;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public long getBorrowNum() {
		return borrowNum;
	}
	public void setBorrowNum(long num) {
		this.borrowNum = num;
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
	public boolean isUserLiked() {
		return userLiked;
	}
	public void setUserLiked(boolean userLiked) {
		this.userLiked = userLiked;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
}
