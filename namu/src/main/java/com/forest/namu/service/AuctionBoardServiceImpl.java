package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.AuctionBoard;
import com.forest.namu.mapper.AuctionBoardMapper;

@Service
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
		
		try {
			mapper.updateQuestion(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteQuestion(long qNum) throws Exception {

		try {
			mapper.deleteQuestion(qNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		
		return result;
	}

	@Override
	public List<AuctionBoard> listQuestion(Map<String, Object> map) {
		List<AuctionBoard> list = null;
		
		try {
			list = mapper.listQuestion(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public AuctionBoard findById(long qNum) {
		AuctionBoard dto = null;
		
		try {
			dto = mapper.findById(qNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
