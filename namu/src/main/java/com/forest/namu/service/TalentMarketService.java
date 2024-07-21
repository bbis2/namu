package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.TalentMarket;

public interface TalentMarketService {
	
	public void insertTalent(TalentMarket dto,String pathname) throws Exception;
	public void insertTalentOption(TalentMarket dto) throws Exception;
	
	public void updateTalent(TalentMarket dto, String pathname) throws Exception;
	public void updateTalentOption(TalentMarket dto) throws Exception;
	public void updateHitCount(long num) throws Exception;
	
	public void deleteTalent(long tboardNum) throws Exception;
	public void deleteTalentByAdmin(long tboardNum,String pathname) throws Exception;
	public void deleteTalentFile(long fileNum, String pathname) throws Exception;
	public void deleteOptionDetail(long detailNum) throws Exception;
	
	public int dataCount(Map<String,Object> map);
	public List<TalentMarket> listTalentMarket(Map<String, Object>map);
	public List<TalentMarket> listTalentOption(long productNum);
	public List<TalentMarket> listOptionDetail(long optionNum);
	public List<TalentMarket> listType();
	
	
	public TalentMarket findById(long tboardNum);
	public TalentMarket findByCategory(long categoryNum);
	public List<TalentMarket> listTalentMarketFile(long tboardNum);
	
	public List<TalentMarket> listCategory();
}
