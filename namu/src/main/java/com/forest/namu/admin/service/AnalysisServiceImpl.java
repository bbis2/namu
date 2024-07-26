package com.forest.namu.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.admin.domain.Analysis;
import com.forest.namu.admin.mapper.AnalysisMapper;

@Service
public class AnalysisServiceImpl implements AnalysisService{
	
	@Autowired
	private AnalysisMapper mapper;

	@Override
	public Analysis selectPageCount() throws Exception {
		Analysis dto = null;
		try {
			dto = mapper.selectPageCount();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

}
