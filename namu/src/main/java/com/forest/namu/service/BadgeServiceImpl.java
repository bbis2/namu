package com.forest.namu.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Badge;
import com.forest.namu.mapper.BadgeMapper;


@Service
public class BadgeServiceImpl implements BadgeService {
	
	@Autowired
	private BadgeMapper mapper;

	@Override
	public void insertBadge1(Badge bto) throws SQLException {
		try {
			mapper.insertBadge1(bto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Badge> selectBadge(String userId) throws SQLException {
		List<Badge> list = null;
		
		try {
			list = mapper.selectBadge(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public long dailyCount(String userId) throws Exception {
		long count = 0;
		
		try {
			count = mapper.dailyCount(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}

}
