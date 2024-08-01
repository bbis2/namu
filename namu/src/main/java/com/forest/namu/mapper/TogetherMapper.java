package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Together;
import com.forest.namu.domain.TogetherApply;

@Mapper
public interface TogetherMapper {
	
	public long togetherListSeq();
	public void insertTogether(Together dto) throws SQLException;
	public void updateTogether(Together dto) throws SQLException;
	public void deleteTogether(long tNum) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<Together> listTogether(Map<String, Object> map);
	public void insertCategory(Together dto) throws SQLException; // 카테고리 추가
	public List<Together> listTogetherCategory(); // 카테고리 리스트
	
	public Together findById(Map<String, Object> map);
	public Together findByPrev(Map<String, Object> map); // 이전글
	public Together findByNext(Map<String, Object> map); // 다음글
	public void updateHitCount(long tNum) throws Exception; // 조회수
	
	public void insertTogetherLike(Map<String, Object>map) throws SQLException; // 좋아요 등록
	public void deleteTogetherLike(Map<String, Object>map) throws SQLException; 
	public int togetherLikeCount(long tNum);
	public Together userTogetherLiked(Map<String, Object> map);
	
	// 모임참가
	public void insertTogetherApply(TogetherApply dto) throws SQLException; // 모임신청
	public List<TogetherApply> listApply (Map<String, Object> map); // 모임리스트
	
	public void updateApply(TogetherApply dto)throws SQLException;	


	
}
