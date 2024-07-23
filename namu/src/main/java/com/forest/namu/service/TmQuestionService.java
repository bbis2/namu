package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.TmQuestion;


public interface TmQuestionService {
	public void insertQuestion(TmQuestion dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<TmQuestion>listQuestion(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<TmQuestion>listQuestion2(Map<String, Object> map);
	
	public void updateQuestion(TmQuestion dto) throws Exception;
	
	public void deleteQuestion(long num) throws Exception;
}
