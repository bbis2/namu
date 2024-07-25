package com.forest.namu.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.admin.domain.Singo;
import com.forest.namu.admin.mapper.SingoManageMapper;

@Service
public class SingoManageServiceImpl implements SingoManageService{
	
	@Autowired
	private SingoManageMapper mapper;

	@Override
	public List<Singo> listReport(Map<String,Object> map) throws Exception {
		List<Singo> list = null;
		
		try {
			list = mapper.listReport(map);
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
	public void updateUser(Singo dto) throws Exception {
		try {
			mapper.updateUser(dto);
			mapper.updateMember(dto.getBanUser());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteChadan(long reportNum,String userId) throws Exception {
		try {
			mapper.deleteChadan(reportNum);
			mapper.updateEnabled(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void releaseUser2(String userId) throws Exception {
		try {
			mapper.releaseUser2(userId);
			mapper.releaseUserMember2(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}



}
