package com.forest.namu.domain;

public class Member {
	private long memberIdx;
	private String userId;
	private String nickName;
	private String userPwd;
	private String regDate;
	private String modifyDate;
	private String secessionDate;
	private int loginFail;
	private String lastLogin;
	private int post;
	private String town1;
	private String addr;
	private String town2;
	private int enabled;
	private int membership;
	
	
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
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getModifyDate() {
		return modifyDate;
	}
	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	public String getSecessionDate() {
		return secessionDate;
	}
	public void setSecessionDate(String secessionDate) {
		this.secessionDate = secessionDate;
	}
	public int getLoginFail() {
		return loginFail;
	}
	public void setLoginFail(int loginFail) {
		this.loginFail = loginFail;
	}
	public String getLastLogin() {
		return lastLogin;
	}
	public void setLastLogin(String lastLogin) {
		this.lastLogin = lastLogin;
	}
	public int getPost() {
		return post;
	}
	public void setPost(int post) {
		this.post = post;
	}
	public String getTown1() {
		return town1;
	}
	public void setTown1(String town1) {
		this.town1 = town1;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getTown2() {
		return town2;
	}
	public void setTown2(String town2) {
		this.town2 = town2;
	}
	public int getEnabled() {
		return enabled;
	}
	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}
	public int getMembership() {
		return membership;
	}
	public void setMembership(int membership) {
		this.membership = membership;
	}
}
