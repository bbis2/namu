package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Used;

@Mapper
public interface UsedMapper {
	public void insertUsed(Used dto) throws SQLException;
	public void updateUsed(Used dto) throws SQLException;
	public void deleteUsed(long num) throws SQLException;
	public List<Used> listUsed(Map<String, Object> map);

	public int dataCount(Map<String, Object> map);
	public void updateHitCount(long num) throws SQLException;
	public Used findById(long num);
	
	public int likeCount(long num);
	public void insertUsedLike(Map<String, Object> map) throws SQLException;
	public void deleteUsedLike(Map<String, Object> map) throws SQLException;
	
}
