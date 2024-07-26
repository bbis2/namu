package com.forest.namu.admin.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.admin.domain.Singo;

public interface SingoManageService {
	public List<Singo> listReport(Map<String,Object> map)throws Exception; 
	public int dataCount(Map<String, Object> map);
	public void updateUser(Singo dto)throws Exception;
	public void deleteChadan(long reportNum,String userId)throws Exception;
	public void releaseUser2(String userId)throws Exception;
	
}
