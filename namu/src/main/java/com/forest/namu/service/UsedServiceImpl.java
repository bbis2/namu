package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Used;
import com.forest.namu.mapper.UsedMapper;

@Service
public class UsedServiceImpl implements UsedService {

	@Autowired
	private UsedMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertUsed(Used dto, String pathname) throws Exception {
		
		try {
			String saveFile = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFile != null) {
				dto.setImageFile(saveFile);
				
			} 
			mapper.insertUsed(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateUsed(Used dto, String pathname) throws Exception {

		try {
			String saveFile = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if(saveFile != null) {
				if(dto.getImageFile().length() != 0) {
					fileManager.doFileDelete(dto.getImageFile(), pathname);
				}
				dto.setImageFile(saveFile);
			} else {
				dto.setImageFile(null);
			}
			
			mapper.updateUsed(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteUsed(long num, String pathname) throws Exception {

		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			mapper.deleteUsed(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Used> listUsed(Map<String, Object> map) {
		List<Used> list = null;
		
		try {
			list = mapper.listUsed(map);
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
	public void updateHitCount(long num) throws Exception {

		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Used findById(long num) {

		Used dto = null;
		
		 try {
	            dto = mapper.findById(num);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		return dto;
	}

	@Override
	public int likeCount(long num) {
		int result = 0;
		
		try {
			result = mapper.likeCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertUsedLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteUsedLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}
}
