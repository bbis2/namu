package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Summary;
import com.forest.namu.domain.TmReview;
import com.forest.namu.mapper.TmOrderMapper;
import com.forest.namu.mapper.TmReviewMapper;


@Service
public class TmReviewServiceImpl implements TmReviewService {
	@Autowired
	private TmReviewMapper mapper;
	
	@Autowired TmOrderMapper mapper2;
	@Override
	public void insertReview(TmReview dto) throws Exception {
		try {
			mapper.insertReview(dto);
			mapper2.updateReviewState(dto.getNum());
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteReview(long applNum) throws Exception {
		try {
			
			mapper.deleteReview(applNum);
			mapper2.updateReviewState0(applNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Summary findByReviewSummary(Map<String, Object> map) {
		Summary dto = null;
		
		try {
			dto = mapper.findByReviewSummary(map);

			dto.setScoreRate1((int)((double)dto.getScore1()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate2((int)((double)dto.getScore2()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate3((int)((double)dto.getScore3()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate4((int)((double)dto.getScore4()/dto.getCount() * 100 + 0.5));
			dto.setScoreRate5((int)((double)dto.getScore5()/dto.getCount() * 100 + 0.5));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<TmReview> listReview(Map<String, Object> map) {
		List<TmReview> list = null;
		
		try {
			list = mapper.listReview(map);
			
			String s;
			for (TmReview dto : list) {
				
				
				s = dto.getNickName().substring(0, 1);
				if(dto.getNickName().length() <= 2) {
					s += "*";
				} else {
					s += dto.getNickName().substring(2, dto.getNickName().length()).replaceAll(".", "*");
				}
				s += dto.getNickName().substring(dto.getNickName().length()-1);
				dto.setNickName(s);
				
				dto.setReview(dto.getReview().replaceAll("\n", "<br>"));
				
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
	public List<TmReview> listReview2(Map<String, Object> map) {
		List<TmReview> list = null;
		
		try {
			list = mapper.listReview2(map);
			
			for (TmReview dto : list) {
				
				dto.setReview(dto.getReview().replaceAll("\n", "<br>"));
				
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
	public void updateReview(TmReview dto) throws Exception {
		try {
			mapper.updateReview(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
