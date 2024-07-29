package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.TogetherNotice;
import com.forest.namu.mapper.TogetherNoticeMapper;

@Service
public class TogetherNoticeServiceImpl implements TogetherNoticeService{

	@Autowired
	private TogetherNoticeMapper mapper;

	@Override
	public void insertNotice(TogetherNotice dto) throws Exception {
		try {
			mapper.insertNotice(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<TogetherNotice> listTogetherNotice(Map<String, Object> map) {
		List<TogetherNotice> list = null;
		
		try {
			list = mapper.listTogetherNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
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
	public void updateNotice(TogetherNotice dto) throws Exception {
		try {
			mapper.updateNotice(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteNotice(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
	
}
