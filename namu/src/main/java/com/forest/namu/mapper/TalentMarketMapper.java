package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.TalentMarket;



@Mapper
public interface TalentMarketMapper {
	
	public long talentSeq();
	public void insertTalent(TalentMarket dto) throws SQLException;
	public void insertTalentFile(TalentMarket dto) throws SQLException;
	
	public long optionSeq();
	public void insertTalentOption(TalentMarket dto) throws SQLException;
	
	public long detailSeq();
	public void insertOptionDetail(TalentMarket dto) throws SQLException;
	
	public TalentMarket findByCategory(long categoryNum);
	public List<TalentMarket> listCategory();
	public List<TalentMarket> listType();
	public TalentMarket findByType(long typeNum);
	
	public void updateTalent(TalentMarket dto) throws SQLException;
	public void updateTalentOption(TalentMarket dto) throws SQLException;
	public void updateOptionDetail(TalentMarket dto) throws SQLException;
	
	public void deleteTalent(long tboardNum) throws SQLException;
	public void deleteTalentFile(long fileNum) throws SQLException;
	public void deleteTalentOption(long optionNum) throws SQLException;
	public void deleteOptionDetail(long detailNum) throws SQLException;
	public void deleteOptionDetail2(long optionNum) throws SQLException;
	
	public int dataCount(Map<String,Object> map);
	public List<TalentMarket> listTalentMarket(Map<String, Object>map);
	
	public TalentMarket findById(long tboardNum);
	public List<TalentMarket> listTalentMarketFile(long tboardNum);
	public List<TalentMarket> listTalentOption(long tboardNum);
	public List<TalentMarket> listOptionDetail(long optionNum);
	
	
	
	
}
