package com.forest.namu.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TalentMarket {
	private long tboardNum;
	private String userId;
	private String subject;
	private String content;
	private int price;
	private String guidelines;
	private String regDate;
	private int hitCount;
	private int typeNum;
	private long type;
	private int optionCount;
	private String categoryNum;
	private String categoryName;
	
	
	private Long optionNum;
	private String optionName;
	private Long parentOption;

	private Long optionNum2;
	private String optionName2;
	
	private Long detailNum;
	private String optionValue;
	private List<Long> detailNums;
	private List<String> optionValues;

	private Long detailNum2;
	private String optionValue2;
	private List<Long> detailNums2;
	private List<String> optionValues2;
	
	private String thumbnail;
	
	private MultipartFile thumbnailFile;
	
	private long fileNum;
	private String fileName;
	private List<MultipartFile> addFiles;
	
	//수정전 옵션
	private long prevOptionNum;
	private long prevOptionNum2;
	
	
	public long getPrevOptionNum() {
		return prevOptionNum;
	}
	public void setPrevOptionNum(long prevOptionNum) {
		this.prevOptionNum = prevOptionNum;
	}
	public long getPrevOptionNum2() {
		return prevOptionNum2;
	}
	public void setPrevOptionNum2(long prevOptionNum2) {
		this.prevOptionNum2 = prevOptionNum2;
	}
	public long getTboardNum() {
		return tboardNum;
	}
	public void setTboardNum(long tboardNum) {
		this.tboardNum = tboardNum;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getGuidelines() {
		return guidelines;
	}
	public void setGuidelines(String guidelines) {
		this.guidelines = guidelines;
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
	public int getTypeNum() {
		return typeNum;
	}
	public void setTypeNum(int typeNum) {
		this.typeNum = typeNum;
	}
	public long getType() {
		return type;
	}
	public void setType(long type) {
		this.type = type;
	}
	
	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}
	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}
	public long getFileNum() {
		return fileNum;
	}
	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFilename(String filename) {
		this.fileName = filename;
	}
	public List<MultipartFile> getAddFiles() {
		return addFiles;
	}
	public void setAddFiles(List<MultipartFile> addFiles) {
		this.addFiles = addFiles;
	}
	
	public String getThumbnail() {
		return thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}
	public int getOptionCount() {
		return optionCount;
	}
	public void setOptionCount(int optionCount) {
		this.optionCount = optionCount;
	}
	public Long getOptionNum() {
		return optionNum;
	}
	public void setOptionNum(Long optionNum) {
		this.optionNum = optionNum;
	}
	public String getOptionName() {
		return optionName;
	}
	public void setOptionName(String optionName) {
		this.optionName = optionName;
	}
	public Long getParentOption() {
		return parentOption;
	}
	public void setParentOption(Long parentOption) {
		this.parentOption = parentOption;
	}
	public Long getOptionNum2() {
		return optionNum2;
	}
	public void setOptionNum2(Long optionNum2) {
		this.optionNum2 = optionNum2;
	}
	public String getOptionName2() {
		return optionName2;
	}
	public void setOptionName2(String optionName2) {
		this.optionName2 = optionName2;
	}
	public Long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(Long detailNum) {
		this.detailNum = detailNum;
	}
	public String getOptionValue() {
		return optionValue;
	}
	public void setOptionValue(String optionValue) {
		this.optionValue = optionValue;
	}
	public List<Long> getDetailNums() {
		return detailNums;
	}
	public void setDetailNums(List<Long> detailNums) {
		this.detailNums = detailNums;
	}
	public List<String> getOptionValues() {
		return optionValues;
	}
	public void setOptionValues(List<String> optionValues) {
		this.optionValues = optionValues;
	}
	public Long getDetailNum2() {
		return detailNum2;
	}
	public void setDetailNum2(Long detailNum2) {
		this.detailNum2 = detailNum2;
	}
	public String getOptionValue2() {
		return optionValue2;
	}
	public void setOptionValue2(String optionValue2) {
		this.optionValue2 = optionValue2;
	}
	public List<Long> getDetailNums2() {
		return detailNums2;
	}
	public void setDetailNums2(List<Long> detailNums2) {
		this.detailNums2 = detailNums2;
	}
	public List<String> getOptionValues2() {
		return optionValues2;
	}
	public void setOptionValues2(List<String> optionValues2) {
		this.optionValues2 = optionValues2;
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
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	
}
