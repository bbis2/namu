package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Used;

public interface UsedService {
	public void insertUsed(Used dto, String pathname) throws Exception;
	public void updateUsed(Used dto, String pathname) throws Exception;
	public void deleteUsed(long num, String pathname) throws Exception;
	public List<Used> listUsed(Map<String, Object> map);
	public List<Used> listCategory();

	public int dataCount(Map<String, Object> map);
	public void updateHitCount(long num) throws Exception;
	public Used findById(long num);
	
	public int likeCount(long num);
	public void insertUsedLike(Map<String, Object> map) throws Exception;
	public void deleteUsedLike(Map<String, Object> map) throws Exception;
	public boolean userUsedLiked(Map<String, Object> map);

	
	// 파일 추가, 삭제만(수정없음)
	public void insertUsedFile(Used dto) throws Exception;
	public void deleteUsedFile(long fileNum) throws Exception;
	public List<Used> listUsedFile(long num);
	public Used findByFileId(long num) throws Exception;
}
