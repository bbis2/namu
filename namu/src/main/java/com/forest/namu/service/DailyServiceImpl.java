package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.Daily;
import com.forest.namu.domain.Reply;
import com.forest.namu.mapper.DailyMapper;


@Service
public class DailyServiceImpl implements DailyService {
	
	@Autowired
	private DailyMapper mapper;
	
	@Autowired
	private MyUtil myUtil;

	
	@Override
	public void insertDaily(Daily dto) throws Exception {
		try {
			mapper.insertDaily(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public List<Daily> listDaily(Map<String, Object> map) {
		List<Daily> list = null;
		
		try {
			list = mapper.listDaily(map);
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
	public Daily findById(long num) {
		Daily dto = null;
		
		try {
			dto = mapper.findById(num);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	//조회수 증가
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
	public Daily findByPrev(Map<String, Object> map) {
		Daily dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public Daily findByNext(Map<String, Object> map) {
		Daily dto = null;

		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateDaily(Daily dto) throws Exception {
		try {
			mapper.updateDaily(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteDaily(long num, String userId, int membership) throws Exception {
		try {
			Daily dto = findById(num);
			if(dto == null || (membership < 99 && ! dto.getUserId().equals(userId))) {
				return;
			}
			mapper.deleteDaily(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}


	@Override
	public void insertDailyLike(Map<String, Object> map) throws Exception {
		
		try {
			mapper.insertDailyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dailyLikeCount(long num) {
		int result =0;
		
		try {
			result = mapper.dailyLikeCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	@Override
	public void deleteDailyLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteDailyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	

	@Override
	public boolean userDailyLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Daily dto = mapper.userDailyLiked(map);
			if(dto != null) {
				result =true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


	
	// 카테고리 
	@Override
	public void insertCategory(Daily dto) throws Exception {
		try {
			mapper.insertCategory(dto);
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public List<Daily> listDailyCategory() {
		List<Daily> listCategory =null;
		
		try {
			listCategory = mapper.listDailyCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listCategory;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		try {
			mapper.insertReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = mapper.listReply(map);
			for(Reply dto : list) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
				// name 생략
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteReply(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<Reply> listReplyAnswer(Map<String, Object> map) {
		List<Reply> list = null;
		
		try {
			list = mapper.listReplyAnswer(map);
			for(Reply dto : list) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyAnswerCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyAnswerCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result ;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		
		try {
			mapper.insertReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = mapper.replyLikeCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countMap;
	}

	@Override
	public void updateReplyShowHide(Map<String, Object> map) throws Exception {
		try {
			mapper.updateReplyShowHide(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}