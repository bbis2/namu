package com.forest.namu.mapper;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Daily;

public interface DailyMapper {
	
	public void insertBoard(Daily dto, String pathname) throws Exception;
	public void updateBoard(Daily dto, String pathname) throws Exception;
	public void deletBoard(Daily dto, String pathname) throws Exception;

	public int dataCount(Map<String, Object>map);
	public List<Daily> listBoard(Map<String, Object>map);
	
	public Daily findById(long num);
	public void updateHitCount(long num) throws Exception;
	public Daily findByPrev(Map<String, Object> map);
	public Daily findByNext(Map<String, Object> map);
}
