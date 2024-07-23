package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Summary;
import com.forest.namu.domain.TmReview;


@Mapper
public interface TmReviewMapper {
	public void insertReview(TmReview dto) throws SQLException;
	
	public Summary findByReviewSummary(Map<String, Object> map);
	public List<TmReview>listReview(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<TmReview>listReview2(Map<String, Object> map);
	
	public void updateReview(TmReview dto) throws SQLException; 
	
	public void deleteReview(long num) throws SQLException;
}