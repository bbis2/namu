package com.forest.namu.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.forest.namu.admin.domain.NoticeManage;

public interface NoticeManageService {
	public void insertNotice(NoticeManage dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<NoticeManage> listNoticeTop();
	public List<NoticeManage> listNotice(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	public NoticeManage findById(long num);
	public NoticeManage findByPrev(Map<String, Object> map);
	public NoticeManage findByNext(Map<String, Object> map);
	
	public void updateNotice(NoticeManage dto, String pathname) throws Exception;
	public void deleteNotice(long num, String pathname) throws Exception;
	
	public List<NoticeManage> listNoticeFile(long num);
	public NoticeManage findByFileId(long fileNum);
	public void deleteNoticeFile(Map<String, Object> map) throws Exception;
	
	public List<NoticeManage> listNoticeCategory() throws Exception;
}
