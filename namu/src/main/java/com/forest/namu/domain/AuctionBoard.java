package com.forest.namu.domain;

public class AuctionBoard {
	private long qNum;
	private String userNickName;
	private String question;
	private String questionDate;
	private String answerNickName;
	private String answer;
	private String answerDate;
	private int secret;
	private String userId;
	private long aNum;
	
	public long getqNum() {
		return qNum;
	}
	public void setqNum(long qNum) {
		this.qNum = qNum;
	}
	public String getUserNickName() {
		return userNickName;
	}
	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getAnswerDate() {
		return answerDate;
	}
	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}
	public String getAnswerNickName() {
		return answerNickName;
	}
	public void setAnswerNickName(String answerNickName) {
		this.answerNickName = answerNickName;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getQuestionDate() {
		return questionDate;
	}
	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getaNum() {
		return aNum;
	}
	public void setaNum(long aNum) {
		this.aNum = aNum;
	}
	
}
