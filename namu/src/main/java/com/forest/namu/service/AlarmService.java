package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Alarm;

public interface AlarmService {
	// 알림 등록
	public void insertAlarm(Alarm dto) throws Exception;
	// 개수
	public int dataCount(Map<String, Object>map);
	// 리스트
	public List<Alarm> listAlarm(Map<String , Object>map);
	// 아티클
	public Alarm findById(long alarm);
	// 읽음처리
	public void updateTimeRead(long alarm) throws Exception;
	
	// 카테고리 리스트
	public List<Alarm> listCategory();
	
	// 알림 확인
	public int alarmCount(String userId);
}
