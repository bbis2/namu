package com.forest.namu.domain;


public class TmQuestion {
	private long num;
	private long tboardNum;
	private String userId;
	private String nickName;
	private int secret;
	private String question;
	private String answer;
	private String answerId;
	private String answerName;
	private String questionDate;
	private String answerDate;
	private int showQuestion;
	private int locked;
	
	
	private String subject;

	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}


	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswerId() {
		return answerId;
	}

	public void setAnswerId(String answerId) {
		this.answerId = answerId;
	}

	public String getAnswerName() {
		return answerName;
	}

	public void setAnswerName(String answerName) {
		this.answerName = answerName;
	}


	public int getShowQuestion() {
		return showQuestion;
	}

	public void setShowQuestion(int showQuestion) {
		this.showQuestion = showQuestion;
	}

	public int getLocked() {
		return locked;
	}

	public void setLocked(int locked) {
		this.locked = locked;
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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	
}
