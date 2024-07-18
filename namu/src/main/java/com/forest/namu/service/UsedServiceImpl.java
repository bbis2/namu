package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

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
			long seq = mapper.used_seq();
			
			dto.setNum(seq);
			
			String saveFile = fileManager.doFileUpload(dto.getThumbFile(), pathname);

			if(saveFile != null) {
				dto.setImageFile(saveFile);
				
			} 
			
			mapper.insertUsed(dto);
			
			// 다중파일
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFile2 = fileManager.doFileUpload(mf, pathname);
					if(saveFile2 == null) {
						continue;
					}
					
					dto.setUploadFile(saveFile2);
					
					insertUsedFile(dto);
				}
			}
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateUsed(Used dto, String pathname) throws Exception {

		try {
			String saveFile = fileManager.doFileUpload(dto.getThumbFile(), pathname);
			
			if(saveFile != null) {
				if(dto.getImageFile().length() != 0) {
					fileManager.doFileDelete(dto.getImageFile(), pathname);
				}
				dto.setImageFile(saveFile);
			} 
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFile2 = fileManager.doFileUpload(mf, pathname);
					if(saveFile2 == null) {
						continue;
					}
					
					dto.setUploadFile(saveFile2);
					
					insertUsedFile(dto);
				}
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
	public int likeCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.likeCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertUsedLike(Map<String, Object> map) throws Exception {

		try {
			mapper.insertUsedLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteUsedLike(Map<String, Object> map) throws Exception {

		try {
			mapper.deleteUsedLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertUsedFile(Used dto) throws Exception {

		try {
			mapper.insertUsedFile(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	@Override
	public Used findByFileId(long num) throws Exception {

		Used dto = null;
		
		try {
			dto = mapper.findByFileId(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return dto;
	}

	@Override
	public List<Used> listUsedFile(long num) {
		
		List<Used> list = null;
		
		try {
			list = mapper.listUsedFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void deleteUsedFile(long fileNum) throws Exception {

		try {
			mapper.deleteUsedFile(fileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
