package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.AuctionBoard;

@Mapper
public interface AuctionBoardMapper {
	// 질문
	public void insertQuestion(AuctionBoard dto) throws SQLException;
	// 답변
	public void updateQuestion(AuctionBoard dto) throws SQLException;
	// 삭제
	public void deleteQuestion(long qNum) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<AuctionBoard> listQuestion(Map<String, Object> map);
	
	public AuctionBoard findById(long qNum);
}