package com.forest.namu.admin.domain;

public class Analysis {
	//게시판 통계
	private long delieveryCount;
	private long dailyCount;
	private long borrowCount;
	private long rentCount;
	private long usedCount;
	private long talentMarketCount;
	private long togetherlistCount;
	private long auctionCount;
	private String day;
	private String source_table;
	private long num;
	private String subject;
	private long hitCount;
	private long postCount;
	private String week;
	private String month;
	private String week_start_date;
	private String month_start_date;
	private String tablename;
	private String nickname;
	private long total_count;
	private long sumedMoney;
	
	private long allRefund;
	private long allCharge;
	
	private long memberIdx;
	private String userId;
	private String userName;
	private String regDate;
	private long pointVar;
	private long currentPoint;
	private String description;
	private long totalPoints;
	private long totalPointsSum;

	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public long getPointVar() {
		return pointVar;
	}
	public void setPointVar(long pointVar) {
		this.pointVar = pointVar;
	}
	public long getCurrentPoint() {
		return currentPoint;
	}
	public void setCurrentPoint(long currentPoint) {
		this.currentPoint = currentPoint;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getLastMoney() {
		return lastMoney;
	}
	public void setLastMoney(long lastMoney) {
		this.lastMoney = lastMoney;
	}
	private long lastMoney;
	
	public long getAllCharge() {
		return allCharge;
	}
	public void setAllCharge(long allCharge) {
		this.allCharge = allCharge;
	}
	private long totalMoney;
	private long totalRefund;
	
	public long getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(long totalMoney) {
		this.totalMoney = totalMoney;
	}
	public long getTotalRefund() {
		return totalRefund;
	}
	public void setTotalRefund(long totalRefund) {
		this.totalRefund = totalRefund;
	}
	public String getTablename() {
		return tablename;
	}
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public long getPostCount() {
		return postCount;
	}
	public void setPostCount(long postCount) {
		this.postCount = postCount;
	}
	public String getWeek() {
		return week;
	}
	public void setWeek(String week) {
		this.week = week;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getSource_table() {
		return source_table;
	}
	public void setSource_table(String source_table) {
		this.source_table = source_table;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public long getHitCount() {
		return hitCount;
	}
	public void setHitCount(long hitCount) {
		this.hitCount = hitCount;
	}
	private String reg_date;
	private long totalCount;
	
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public long getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}
	public long getDelieveryCount() {
		return delieveryCount;
	}
	public void setDelieveryCount(long delieveryCount) {
		this.delieveryCount = delieveryCount;
	}
	public long getDailyCount() {
		return dailyCount;
	}
	public void setDailyCount(long dailyCount) {
		this.dailyCount = dailyCount;
	}
	public long getBorrowCount() {
		return borrowCount;
	}
	public void setBorrowCount(long borrowCount) {
		this.borrowCount = borrowCount;
	}
	public long getRentCount() {
		return rentCount;
	}
	public void setRentCount(long rentCount) {
		this.rentCount = rentCount;
	}
	public long getUsedCount() {
		return usedCount;
	}
	public void setUsedCount(long usedCount) {
		this.usedCount = usedCount;
	}
	public long getTalentMarketCount() {
		return talentMarketCount;
	}
	public void setTalentMarketCount(long talentMarketCount) {
		this.talentMarketCount = talentMarketCount;
	}
	public long getTogetherlistCount() {
		return togetherlistCount;
	}
	public void setTogetherlistCount(long togetherlistCount) {
		this.togetherlistCount = togetherlistCount;
	}
	public long getAuctionCount() {
		return auctionCount;
	}
	public void setAuctionCount(long auctionCount) {
		this.auctionCount = auctionCount;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getWeek_start_date() {
		return week_start_date;
	}
	public void setWeek_start_date(String week_start_date) {
		this.week_start_date = week_start_date;
	}
	public String getMonth_start_date() {
		return month_start_date;
	}
	public void setMonth_start_date(String month_start_date) {
		this.month_start_date = month_start_date;
	}
	public long getTotal_count() {
		return total_count;
	}
	public void setTotal_count(long total_count) {
		this.total_count = total_count;
	}
	public long getSumedMoney() {
		return sumedMoney;
	}
	public void setSumedMoney(long sumedMoney) {
		this.sumedMoney = sumedMoney;
	}
	public long getAllRefund() {
		return allRefund;
	}
	public void setAllRefund(long allRefund) {
		this.allRefund = allRefund;
	}
	public long getTotalPoints() {
		return totalPoints;
	}
	public void setTotalPoints(long totalPoints) {
		this.totalPoints = totalPoints;
	}
	public long getTotalPointsSum() {
		return totalPointsSum;
	}
	public void setTotalPointsSum(long totalPointsSum) {
		this.totalPointsSum = totalPointsSum;
	}
	
}
