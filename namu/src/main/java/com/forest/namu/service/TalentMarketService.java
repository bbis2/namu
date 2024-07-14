package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.TalentMarket;

public interface TalentMarketService {
	
	public void insertTalent(TalentMarket dto,String pathname) throws Exception;
	public void insertTalentFile(TalentMarket dto) throws Exception;
	
	public void updateTalent(TalentMarket dto) throws Exception;
	public void deleteTalent(long tboardNum) throws Exception;
	public void deleteTalentFile(long fileNum) throws Exception;
	
	public int dataCount(Map<String,Object> map);
	public List<TalentMarket> listTalentMarket(Map<String, Object>map);
	
	public TalentMarket findById(long tboardNum);
	public List<TalentMarket> listTalentMarketFile(long tboardNum);
	
	public List<TalentMarket> listCategory();
}
