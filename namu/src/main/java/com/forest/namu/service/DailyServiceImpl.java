package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Daily;
import com.forest.namu.mapper.DailyMapper;

@Service
public class DailyServiceImpl implements DailyService {
	
	@Autowired
	private DailyMapper mapper;


	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public Daily findById(long num) {
		Daily dto = null;
		
		try {
			dto = mapper.findById(num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Daily findByPrev(Map<String, Object> map) {
		Daily dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Daily findByNext(Map<String, Object> map) {
		Daily dto = null;

		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void insertDaily(Daily dto, String pathname) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Daily> listDaily(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Daily> listDailyCategory(long categoryNum) {
		List<Daily> listDailyCategory = null;
		
		try {
			listDailyCategory = mapper.listDailyCategory(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listDailyCategory;
	}










}
