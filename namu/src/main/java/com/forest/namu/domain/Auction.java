package com.forest.namu.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Auction {
	private long aNum;
	private String subject;
	private String content;
	private long minBid;
	private String regDate;
	
	// 현재 입찰가 
	private long bid;
	// 입찰수
	private long bidCount;
	// 입찰번호
	private long bidNum;
	
	private String bidDate;
	// 낙찰자
	private String soldId;
	// 입찰 신청여부
	private int apply;
	
	private long hitCount;
	private int state;
	
	private String salesStart;
	private String startDate;
	private String startTime;
	
	private String salesEnd;
	private String endDate;
	private String endTime;
	
	private String userId;

	private String nickName;
	
	private MultipartFile thumbFile;
	private String imageFile;
	
	private List <MultipartFile> selectFile;
	private String uploadFile;
	private long fileNum;
	
	private int likeCount;
	
	// 카테고리 번호, 이름
	private String name;
	private int cnum;
	
	// 주소
	private int town;
	
	// 신고
	private String tableName;

	public long getaNum() {
		return aNum;
	}

	public void setaNum(long aNum) {
		this.aNum = aNum;
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

	public long getMinBid() {
		return minBid;
	}

	public void setMinBid(long minBid) {
		this.minBid = minBid;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public long getBid() {
		return bid;
	}

	public void setBid(long bid) {
		this.bid = bid;
	}

	public long getBidCount() {
		return bidCount;
	}

	public void setBidCount(long bidCount) {
		this.bidCount = bidCount;
	}

	public long getBidNum() {
		return bidNum;
	}

	public void setBidNum(long bidNum) {
		this.bidNum = bidNum;
	}

	public String getBidDate() {
		return bidDate;
	}

	public void setBidDate(String bidDate) {
		this.bidDate = bidDate;
	}

	public String getSoldId() {
		return soldId;
	}

	public void setSoldId(String soldId) {
		this.soldId = soldId;
	}

	public int getApply() {
		return apply;
	}

	public void setApply(int apply) {
		this.apply = apply;
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

	public String getSalesStart() {
		return salesStart;
	}

	public void setSalesStart(String salesStart) {
		this.salesStart = salesStart;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getSalesEnd() {
		return salesEnd;
	}

	public void setSalesEnd(String salesEnd) {
		this.salesEnd = salesEnd;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
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

	public int getTown() {
		return town;
	}

	public void setTown(int town) {
		this.town = town;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

}
