package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.TogetherNotice;

public interface TogetherNoticeService {

	public void insertNotice(TogetherNotice dto) throws Exception;
	public List<TogetherNotice>listTogetherNotice(Map<String, Object>map);
	public int dataCount(Map<String, Object> map);
	public void updateNotice(TogetherNotice dto) throws Exception;
	public void deleteNotice(long num) throws Exception;
}
