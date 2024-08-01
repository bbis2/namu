package com.forest.namu.liveChat;

public class ChatMessage {
	private long num;
	
	private String roomName;	// 룸이름
	private String ownerIdx;	// 룸 오너
	private String fromIdx;		// 보낸사람
	private String fromName;	// 보낸사람이름
	private int classify;		// 구분(1:유저질문, 2:오너답변)
	private String toIdx;		// 받는사람
	private String toName;		// 받는사람이름
	private String content;
	private String readIdx;		// 메시지를 읽은 사람
	private String sendDate;	// 보낸날짜
	
	// 출력 용
	private String userIdx;		// 유저아이디
	private String userName;	// 유저이름
	private String sdate;		// 보낸날짜
	private String dateWeek;	// 보낸날짜 및 요일
	private String stime;		// 보낸시간
	private int question;		// 문의 존재 유무(1:문의존재, 0:답변완료)
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getOwnerIdx() {
		return ownerIdx;
	}
	public void setOwnerIdx(String ownerIdx) {
		this.ownerIdx = ownerIdx;
	}
	public String getFromIdx() {
		return fromIdx;
	}
	public void setFromIdx(String fromIdx) {
		this.fromIdx = fromIdx;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public int getClassify() {
		return classify;
	}
	public void setClassify(int classify) {
		this.classify = classify;
	}
	public String getToIdx() {
		return toIdx;
	}
	public void setToIdx(String toIdx) {
		this.toIdx = toIdx;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadIdx() {
		return readIdx;
	}
	public void setReadIdx(String readIdx) {
		this.readIdx = readIdx;
	}
	public String getSendDate() {
		return sendDate;
	}
	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}
	public String getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(String userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getDateWeek() {
		return dateWeek;
	}
	public void setDateWeek(String dateWeek) {
		this.dateWeek = dateWeek;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public int getQuestion() {
		return question;
	}
	public void setQuestion(int question) {
		this.question = question;
	}
}
