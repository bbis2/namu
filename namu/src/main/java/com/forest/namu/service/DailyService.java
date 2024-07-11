package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Daily;

public interface DailyService {
	public void insertDaily(Daily dto, String pathname) throws Exception;
	public void updateDaily(Daily dto, String pathname) throws Exception;
	public void deleteBorad(long num, String userId, int membership) throws Exception; // 수정할 수 있음
	
	public int dataCount(Map<String, Object>map);
	public List<Daily> listDaily(Map<String, Object> map);
	
}
