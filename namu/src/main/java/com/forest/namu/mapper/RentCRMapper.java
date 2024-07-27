package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

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

    public void rejectRentRequest(Map<String, Object> map) throws SQLException; // 받은 신청 거절하기
}
