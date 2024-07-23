package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.AuctionBoard;

public interface AuctionBoardService {
	public void insertQuestion(AuctionBoard dto) throws Exception;
	public void updateQuestion(AuctionBoard dto) throws Exception;
	public void deleteQuestion(long qNum) throws Exception;
	
	public void insertAnswer(AuctionBoard dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<AuctionBoard> listQuestion(Map<String, Object> map);
	
	public AuctionBoard findById(long qNum);
	public AuctionBoard findByPrev(Map<String, Object> map);
	public AuctionBoard findByNext(Map<String, Object> map);
	
}
