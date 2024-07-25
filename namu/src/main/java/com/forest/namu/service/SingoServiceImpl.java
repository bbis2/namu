package com.forest.namu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Singo;
import com.forest.namu.mapper.SingoMapper;

@Service
public class SingoServiceImpl implements SingoService {
	
	@Autowired
	private SingoMapper mapper;

	@Override
	public void insertReport(Singo dto) throws Exception {
		try {
			mapper.insertReport(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
