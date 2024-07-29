package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Alarm;
import com.forest.namu.mapper.AlarmMapper;

@Service
public class AlarmServiceImpl implements AlarmService {
	@Autowired AlarmMapper mapper;
	
	@Override
	public void insertAlarm(Alarm dto) throws Exception {

		try {
			mapper.insertAlarm(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Alarm> listAlarm(Map<String, Object> map) {
		List<Alarm> list = null;
		
		try {
			list = mapper.listAlarm(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Alarm findById(long alarm) {
		Alarm dto = null;
		
		try {
			dto = mapper.findById(alarm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateTimeRead(long alarm) throws Exception {

		try {
			mapper.updateTimeRead(alarm);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Alarm> listCategory() {
		List<Alarm> list = null;
		
		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
