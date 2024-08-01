package com.forest.namu.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class TogetherBoard {
	private long num; // 글번호
	private long tNum; // 모임번호
	private String userId; // 아이디
	private String subject; // 제목
	private String content; // 내용
	private String regDate; // 등록일
	private int hitCount; 	// 조회수
	private String nickName; // 닉네임
	
	private int replyCount;	// 리플 개수
	private int freeBoardLikeCount; // 좋아요
	
	private long fileNum;		// 파일번호
	private String filename; 	// 파일이름
	private List<MultipartFile> selectFile; 

	private String[] listFilename; 


	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}

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

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}


	public int getFreeBoardLikeCount() {
		return freeBoardLikeCount;
	}

	public void setFreeBoardLikeCount(int freeBoardLikeCount) {
		this.freeBoardLikeCount = freeBoardLikeCount;
	}

	public long getFileNum() {
		return fileNum;
	}

	public void setFileNum(long fileNum) {
		this.fileNum = fileNum;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	public String[] getListFilename() {
		return listFilename;
	}

	public void setListFilename(String[] listFilename) {
		this.listFilename = listFilename;
	}
	
}
