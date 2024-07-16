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
	public void insertDaily(Daily dto) throws Exception {
		try {
			mapper.insertDaily(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public List<Daily> listDaily(Map<String, Object> map) {
		List<Daily> list = null;
		
		try {
			list = mapper.listDaily(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

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

	//조회수 증가
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
	public void updateDaily(Daily dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDaily(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void insertDailyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteDailyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

	@Override
	public boolean userDailyLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}


	@Override
	public int DailyLikeCount(long num) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	// 카테고리 
	@Override
	public void insertCategory(Daily dto) throws Exception {
		try {
			mapper.insertCategory(dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public List<Daily> listDailyCategory() {
		List<Daily> listCategory =null;
		
		try {
			listCategory = mapper.listDailyCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listCategory;
	}
}