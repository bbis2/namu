package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Alarm;

@Mapper
public interface AlarmMapper {
	// 알림 등록
	public void insertAlarm(Alarm dto) throws SQLException;
	// 개수
	public int dataCount(Map<String, Object>map);
	// 리스트
	public List<Alarm> listAlarm(Map<String , Object>map);
	// 아티클
	public Alarm findById(long alarmNum);
	// 읽음처리
	public void updateTimeRead(long alarmNum) throws SQLException;

	// 카테고리 리스트
	public List<Alarm> listCategory();
	
	// 알림 확인
	public int alarmCount(String userId);
}
