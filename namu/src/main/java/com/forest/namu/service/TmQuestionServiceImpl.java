package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.forest.namu.domain.TmQuestion;
import com.forest.namu.mapper.TmQuestionMapper;

@Service
public class TmQuestionServiceImpl implements TmQuestionService {
	@Autowired
	private TmQuestionMapper mapper;
	
	
	@Override
	public void insertQuestion(TmQuestion dto) throws Exception {
		try {
			mapper.insertQuestion(dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteQuestion(long num) throws Exception {
		try {
		
			mapper.deleteQuestion(num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
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
	public List<TmQuestion> listQuestion(Map<String, Object> map) {
		List<TmQuestion> list = null;
		
		try {
			list = mapper.listQuestion(map);
			
			String s;
			for (TmQuestion dto : list) {
				
				
				s = dto.getNickName().substring(0, 1);
				if(dto.getNickName().length() <= 2) {
					s += "*";
				} else {
					s += dto.getNickName().substring(2, dto.getNickName().length()).replaceAll(".", "*");
				}
				s += dto.getNickName().substring(dto.getNickName().length()-1);
				dto.setNickName(s);
				
				dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
				
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount2(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount2(map); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<TmQuestion> listQuestion2(Map<String, Object> map) {
		List<TmQuestion> list = null;
		
		try {
			list = mapper.listQuestion2(map);
			for (TmQuestion dto : list) {
				
				dto.setQuestion(dto.getQuestion().replaceAll("\n", "<br>"));
				
				if(dto.getAnswer() != null) {
					dto.setAnswer(dto.getAnswer().replaceAll("\n", "<br>"));
				}
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateQuestion(TmQuestion dto) throws Exception {
		try {
			mapper.updateQuestion(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
