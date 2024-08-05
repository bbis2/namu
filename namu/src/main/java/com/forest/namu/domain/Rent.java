package com.forest.namu.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Rent {

	// 빌려드림 테이블
	private long rentNum;
	private String userId;
	private String subject;
	private int hPrice;
	private int dPrice;
	private int wPrice;
	private int mPrice;
	private String content;
	private int visible; // 1일때 공개, 0일때 숨김
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

	////////////////////////////////////////////////////////////////////
	public long getRentNum() {
		return rentNum;
	}
	public void setRentNum(long rentNum) {
		this.rentNum = rentNum;
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
	public int gethPrice() {
		return hPrice;
	}
	public void sethPrice(int hPrice) {
		this.hPrice = hPrice;
	}
	public int getdPrice() {
		return dPrice;
	}
	public void setdPrice(int dPrice) {
		this.dPrice = dPrice;
	}
	public int getwPrice() {
		return wPrice;
	}
	public void setwPrice(int wPrice) {
		this.wPrice = wPrice;
	}
	public int getmPrice() {
		return mPrice;
	}
	public void setmPrice(int mPrice) {
		this.mPrice = mPrice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getVisible() {
		return visible;
	}
	public void setVisible(int visible) {
		this.visible = visible;
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
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassedTime() {
		return passedTime;
	}
	public void setPassedTime(String passedTime) {
		this.passedTime = passedTime;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public long getImageNum() {
		return imageNum;
	}
	public void setImageNum(long imageNum) {
		this.imageNum = imageNum;
	}
	public List<MultipartFile> getImage() {
		return image;
	}

	public void setImage(List<MultipartFile> image) {
		this.image = image;
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

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
}
