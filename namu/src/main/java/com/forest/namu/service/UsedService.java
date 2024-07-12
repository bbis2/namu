package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Used;

public interface UsedService {
	public void insertUsed(Used dto, String pathname) throws Exception;
	public void updateUsed(Used dto, String pathname) throws Exception;
	public void deleteUsed(long num, String pathname, String userId, int membership) throws Exception;
	public List<Used> listUsed(Map<String, Object> map);

	public int dataCount(Map<String, Object> map);
	public void updateHitCount(long num) throws Exception;
	public Used findById(long num);
}
