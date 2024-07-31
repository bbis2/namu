package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.forest.namu.domain.Point;
import com.forest.namu.domain.RentCR;

@Mapper
public interface RentCRMapper {

	public int checkRentOverlap(Map<String, Object> map) throws SQLException; // 중복 확인
	
	public long rentConfirmSeq();
	public void insertRentConfirm(RentCR rentCR) throws SQLException; // 신청 등록
	public void depositProcess(Point dto) throws SQLException; // 보증금 삽입
	
	public long getDeposit(Map<String, Object> map); // 보증금 가져오기
	public Point getPoint(long reqNum); 			 // 보증금 가져오기
    public void cancelRent(Map<String, Object> map) throws SQLException; // 신청 취소
    
	public RentCR checkState(Map<String, Object> map); // 신청 상태 확인
	
    public List<RentCR> selectMyApplications(String userId); // 보낸 신청 가져오기
    public List<RentCR> selectReceivedRequests(String userId); // 받은 신청 가져오기
    
    public RentCR findByReqNum(Long reqNum);
    public RentCR findByRentNum(Map<String, Object> map);
    public void updateRentCRState(Map<String, Object> map) throws SQLException; // 받은 신청 수락하기
    
    public void insertUserReview(Map<String, String> reviewData) throws SQLException; // 사용자 후기 추가
    public void insertRentReview(Map<String, String> reviewData) throws SQLException; // 대여 물품 후기 추가
    public void updateUserManner(@Param("userId") String userId, @Param("mannerChange") int mannerChange) throws SQLException; // 나무매너 변경

	public void updateUserReviewed(Map<String, String> map);
	public void updateRentReviewed(Map<String, String> map);
	public void updateBorrowerReviewed(Map<String, String> map);

	public int selectRentReviewCount(long rentNum); // 리뷰 개수 가져오기
	// 리뷰 가져오기
	public List<Map<String, Object>> selectRentReviews(@Param("rentNum") long rentNum, @Param("offset") int offset, @Param("pageSize") int pageSize);
	
	public Map<String, Object> getEmailByRentNum(long rentNum) throws SQLException; // 글쓴이 이메일 가져오기
	public Map<String, Object> getEmailByReqNum(long reqNum) throws SQLException; // 신청자 이메일 가져오기
}
