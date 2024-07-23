package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Summary;
import com.forest.namu.domain.TmReview;

public interface TmReviewService {
	public void insertReview(TmReview dto) throws Exception;
	
	public Summary findByReviewSummary(Map<String, Object> map);
	public List<TmReview>listReview(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<TmReview>listReview2(Map<String, Object> map);
	
	public void updateReview(TmReview dto) throws Exception;
	
	public void deleteReview(long num) throws Exception;
}
