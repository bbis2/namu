package com.forest.namu.admin.mapper;

import java.util.List;
import java.util.Map;

import com.forest.namu.admin.domain.Singo;

public interface SingoManageMapper {
	public List<Singo> listReport(Map<String,Object> map)throws Exception; 
	public int dataCount(Map<String, Object> map);
	public void updateUser(Singo dto)throws Exception;
	public void updateMember(String userId)throws Exception;
	public List<Singo> selectUser()throws Exception;
	public void releaseUser()throws Exception;
	public void releaseMember()throws Exception;
	public void deleteChadan(long reportNum)throws Exception;
	public void updateEnabled(String userId)throws Exception;
	public void releaseUser2(String userId)throws Exception;
	public void releaseUserMember2(String userId)throws Exception;

}
