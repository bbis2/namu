package com.forest.namu.domain;

// 세션에 저장할 정보(아이디, 이름, 권한 등)
public class SessionInfo {
	private long memberIdx;
	private String userId;
	private String nickName;
	private int membership;
	private int enabled;
	private String town1;
	private String town2;
	
	
	public String getTown1() {
		return town1;
	}
	public void setTown1(String town1) {
		this.town1 = town1;
	}
	public String getTown2() {
		return town2;
	}
	public void setTown2(String town2) {
		this.town2 = town2;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
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
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
}
