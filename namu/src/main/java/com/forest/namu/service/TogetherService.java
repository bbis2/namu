package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Together;

public interface TogetherService {
	public void insertTogether(Together dto, String pathname) throws Exception;
	public int dataCount(Map<String, Object> map);
	public List<Together> listTogether(Map<String, Object> map);
	
	public void insertCategory(Together dto) throws Exception;
	public List<Together> listTogetherCategory();
	
	public Together findById(long tNum);
	public Together findByPrev(Map<String, Object> map);
	public Together findByNext(Map<String, Object> map);
	
	public void updateTogether(Together dto, String pathname) throws Exception;
	public void deleteTogether(long tNum, String userId, int membership) throws Exception; // ?
	public void updateHitCount(long tNum) throws Exception;
	
	public void insertTogetherLike(Map<String, Object> map) throws Exception;
	public void deleteTogetherLike(Map<String, Object> map) throws Exception;
	public int togetherLikeCount (long tNum);
	public boolean userTogetherLiked(Map<String, Object> map);

}
