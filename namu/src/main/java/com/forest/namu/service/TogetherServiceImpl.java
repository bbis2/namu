package com.forest.namu.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Together;
import com.forest.namu.domain.TogetherApply;
import com.forest.namu.mapper.TogetherMapper;

@Service
public class TogetherServiceImpl implements TogetherService{

	@Autowired
	private TogetherMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertTogether(Together dto, String pathname) throws Exception {
		try {
			long seq = mapper.togetherListSeq();
			dto.settNum(seq);
		
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if(saveFilename != null) {
				dto.setThumbnail(saveFilename);
			}
			
			mapper.insertTogether(dto);
		
		} catch (Exception e) {
			e.printStackTrace();
			throw e ;
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
	public List<Together> listTogether(Map<String, Object> map) {
		List<Together> list = null;

		try {
			
			list = mapper.listTogether(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public void insertCategory(Together dto) throws Exception {
		try {
			mapper.insertCategory(dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public List<Together> listTogetherCategory() {
		List<Together> listCategory = null;
		
		try {
			listCategory = mapper.listTogetherCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return listCategory;
	}

	@Override
	public Together findByPrev(Map<String, Object> map) {
		Together  dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Together findByNext(Map<String, Object> map) {
		Together dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	


	@Override
	public void updateTogether(Together dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			
			if(saveFilename != null) {
				if(dto.getThumbnail().length() != 0) {
					fileManager.doFileDelete(dto.getThumbnail(),pathname);
				}
				dto.setThumbnail(saveFilename);
			}
			mapper.updateTogether(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteTogether(long tNum, String userId, int membership) throws Exception {
		try {
			Map<String, Object> map = new HashMap<>();
			map.put("tNum", tNum);
			map.put("userId", userId);
			map.put("acceptance", -1);
			Together dto = findById(map);
			if(dto == null ||  (membership < 99 && ! dto.getUserId().equals(userId))) {
				return;
			}
			
			mapper.deleteTogether(tNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateHitCount(long tNum) throws Exception {
		try {
			mapper.updateHitCount(tNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Together findById(Map<String, Object> map) {
		Together dto = null;
		
		try {
			dto = mapper.findById(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertTogetherLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertTogetherLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteTogetherLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteTogetherLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;			
		}
		
	}

	@Override
	public int togetherLikeCount(long tNum) {
		int result = 0;
		try {
			result  = mapper.togetherLikeCount(tNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userTogetherLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Together dto = mapper.userTogetherLiked(map);
			if(dto  != null)  {
				result =true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	
//  모임참가
	
	@Override
	public void insertTogetherApply(TogetherApply dto) throws Exception {
		try {
			mapper.insertTogetherApply(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<TogetherApply> listApply(Map<String, Object> map) {
		List<TogetherApply> list = null;
		
		try {
			list= mapper.listApply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}


	@Override
	public void updateApply(TogetherApply dto) throws Exception {
		try {
			mapper.updateApply(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}


	
}
