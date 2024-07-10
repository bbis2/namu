package com.forest.namu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.TalentMarket;

@Mapper
public interface TalentMarketMapper {
	
	
	public int dataCount(Map<String,Object> map);
	public List<TalentMarket> listTalentMarket(Map<String, Object>map);
	
	public TalentMarket findById(long tboardNum);
	public List<TalentMarket> listTalentMarketFile(long tboardNum);
	
	public List<TalentMarket> listCategory();
}
