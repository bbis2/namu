package com.forest.namu.domain;

import org.springframework.web.multipart.MultipartFile;

public class Together {
	private long tNum;
	private String userId;

	private String name;
	private String subject;
	private String content;
	private String regDate;
	private int memberCnt;
	private String thumbnail;
	private String nickName;
	private int hitCount;

	private MultipartFile selectFile;
	
	private String categoryNum;
	private String categoryName;

	private int replyCount;
	private int togetherLikeCount;
	
	private String town;

	private int userApply; // 참여 여부

	public long gettNum() {
		return tNum;
	}

	public void settNum(long tNum) {
		this.tNum = tNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public int getMemberCnt() {
		return memberCnt;
	}

	public void setMemberCnt(int memberCnt) {
		this.memberCnt = memberCnt;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public MultipartFile getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}

	public String getCategoryNum() {
		return categoryNum;
	}

	public void setCategoryNum(String categoryNum) {
		this.categoryNum = categoryNum;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public int getTogetherLikeCount() {
		return togetherLikeCount;
	}

	public void setTogetherLikeCount(int togetherLikeCount) {
		this.togetherLikeCount = togetherLikeCount;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public int getUserApply() {
		return userApply;
	}

	public void setUserApply(int userApply) {
		this.userApply = userApply;
	}

	
}
