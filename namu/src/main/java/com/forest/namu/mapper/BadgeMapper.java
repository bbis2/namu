package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Badge;

@Mapper
public interface BadgeMapper {
	public void insertBadge1(Badge bto) throws SQLException;
	public List<Badge> selectBadge(String userId)throws SQLException;
	public long dailyCount(String userId)throws Exception;
}
