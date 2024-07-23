package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.TmQuestion;



@Mapper
public interface TmQuestionMapper {
	public void insertQuestion(TmQuestion dto) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<TmQuestion>listQuestion(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<TmQuestion>listQuestion2(Map<String, Object> map);
	
	public void updateQuestion(TmQuestion dto) throws SQLException;

	
	public void deleteQuestion(long num) throws SQLException;
}
