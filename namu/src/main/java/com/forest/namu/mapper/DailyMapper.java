package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Daily;

@Mapper
public interface DailyMapper {
	
	public void insertDaily(Daily dto) throws SQLException; // 등록
	public void updateDaily(Daily dto) throws SQLException; // 수정
	public void deleteDaily(Daily dto) throws SQLException; // 삭제
	
	public int dataCount(Map<String, Object> map);			// 갯수 
	public List<Daily> listDaily(Map<String, Object>map);	// daily 게시판 리스트
	
	public Daily findByCategory(long categoryNum);
	public List<Daily> listDailyCategory(long categoryNum);
	
	public Daily findById(long num);						// 검색 찾기
	public void updateHitCount(long num) throws Exception;	// 
	public Daily findByPrev(Map<String, Object> map); 		// 이전글
	public Daily findByNext(Map<String, Object> map); 		// 다음글
	
	public Daily findByTag(long tagId);
	public void insertDailyLike(Map<String, Object> map) throws SQLException;
	public void deleteDailyLike(Map<String, Object> map) throws SQLException;
	public int	dailyLikeCount(long num);
	public Daily userDailyLiked(Map<String, Object> map);
	
	

}
