package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.AuctionBoard;

@Mapper
public interface AuctionBoardMapper {
	public void insertQuestion(AuctionBoard dto) throws SQLException;
	public void updateQuestion(AuctionBoard dto) throws SQLException;
	public void deleteQuestion(long qNum) throws SQLException;
	
	public void insertAnswer(AuctionBoard dto) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<AuctionBoard> listQuestion(Map<String, Object> map);
	
	public AuctionBoard findById(long qNum);
	public AuctionBoard findByPrev(Map<String, Object> map);
	public AuctionBoard findByNext(Map<String, Object> map);
	

}
