package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.forest.namu.domain.TogetherNotice;

public interface TogetherNoticeMapper {

	public void insertNotice(TogetherNotice dto) throws SQLException; // 공지사항 등록
	public List<TogetherNotice> listTogetherNotice(Map<String, Object>map); // 공지사항 리스트 
	public int dataCount(Map<String, Object> map); // 조회수
	public void updateNotice(TogetherNotice dto) throws SQLException; // 공지사항 수정
	public void deleteNotice(long num)throws SQLException; // 공지사항 삭제
	
	
}
