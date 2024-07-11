package com.forest.namu.admin.domain;

public class MemberManage {
	// member 테이블 (회원)
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
	
	// memberDetail 테이블 (회원 상세)
	private String userName;
	private String birth;
	private String email;
	private String email1;
	private String email2;
	private String ment;
	private int userManner;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	
	// memberAuthority 테이블 (회원 권한)
	private String authority;
	
	// memberState 테이블 (회원 상태)
	private String startDate; // 회원 상태 변경 날짜
	private String endDate; // 회원 상태 변경 종료 날짜
	private String reason;
	private int stateCode;
	private long reportNum; // 신고 번호
	
	
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getMent() {
		return ment;
	}
	public void setMent(String ment) {
		this.ment = ment;
	}
	public int getUserManner() {
		return userManner;
	}
	public void setUserManner(int userManner) {
		this.userManner = userManner;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public int getStateCode() {
		return stateCode;
	}
	public void setStateCode(int stateCode) {
		this.stateCode = stateCode;
	}
	public long getReportNum() {
		return reportNum;
	}
	public void setReportNum(long reportNum) {
		this.reportNum = reportNum;
	}
}
