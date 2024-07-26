package com.forest.namu.domain;

public class BoardReply {
	private long rNum;
	private long num;
	private String userId;
	private String nickName;
	private String content;
	private String regDate;
	private long answer;
	
	private int answerCount;
	private int likeCount;
	private int disLikeCount;
	
	
	public long getrNum() {
		return rNum;
	}
	public void setrNum(long rNum) {
		this.rNum = rNum;
	}
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public long getAnswer() {
		return answer;
	}
	public void setAnswer(long answer) {
		this.answer = answer;
	}
	public int getAnswerCount() {
		return answerCount;
	}
	public void setAnswerCount(int answerCount) {
		this.answerCount = answerCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public int getDisLikeCount() {
		return disLikeCount;
	}
	public void setDisLikeCount(int disLikeCount) {
		this.disLikeCount = disLikeCount;
	}
	
	
	
	

}
