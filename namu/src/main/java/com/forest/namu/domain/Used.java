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
	
	private int likeCount;
	
	private boolean userLiked;
	
	// 카테고리 번호, 이름
	private String name;
	private int cnum;
	
	// 주소
	private String town;
	
	// 신고
	private String tableName;
	
	// 프로필 사진
	private String photo;

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

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public boolean isUserLiked() {
		return userLiked;
	}

	public void setUserLiked(boolean userLiked) {
		this.userLiked = userLiked;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
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

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
}
