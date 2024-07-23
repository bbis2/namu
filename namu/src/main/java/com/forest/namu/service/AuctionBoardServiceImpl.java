package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.forest.namu.domain.AuctionBoard;
import com.forest.namu.mapper.AuctionBoardMapper;

public class AuctionBoardServiceImpl implements AuctionBoardService{

	@Autowired
	private AuctionBoardMapper mapper;
	
	@Override
	public void insertQuestion(AuctionBoard dto) throws Exception {

		try {
			mapper.insertQuestion(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateQuestion(AuctionBoard dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteQuestion(long qNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertAnswer(AuctionBoard dto) throws Exception {

		try {
			mapper.insertAnswer(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AuctionBoard> listQuestion(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuctionBoard findById(long qNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuctionBoard findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AuctionBoard findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
