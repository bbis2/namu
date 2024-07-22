package com.forest.namu.service;

import java.sql.SQLException;
import java.util.List;

import com.forest.namu.domain.Badge;

public interface BadgeService {
	public void insertBadge1(Badge bto) throws SQLException;
	public List<Badge> selectBadge(String userId)throws SQLException;
	public long dailyCount(String userId)throws Exception;
}
