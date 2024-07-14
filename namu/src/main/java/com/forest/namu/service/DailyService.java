package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Daily;

public interface DailyService {
	
	public void insertDaily(Daily dto, String pathname);
	public List<Daily> listDaily(Map<String, Object> map);
	
	public int dataCount(Map<String, Object> map);
	public Daily findById(long num);
	public void updateHitCount(long num) throws Exception;
	public Daily findByPrev(Map<String, Object> map);
	public Daily findByNext(Map<String, Object> map);
	
	public List<Daily> listDailyCategory(long categoryNum);
	
}
