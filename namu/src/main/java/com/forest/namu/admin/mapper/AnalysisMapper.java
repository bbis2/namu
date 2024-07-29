package com.forest.namu.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.admin.domain.Analysis;

@Mapper
public interface AnalysisMapper {
	public Analysis selectPageCount()throws Exception;
	public List<Analysis> selectDayPageCount()throws Exception;
	public List<Analysis> selectAlldayCount()throws Exception;
	public List<Analysis> selectHitpage()throws Exception;
	public List<Analysis> selectWeekPageCount()throws Exception;
	public List<Analysis> selectMonthPageCount()throws Exception;
	
	public long selectSeoul()throws Exception;
	public long selectBusan()throws Exception;
	public long selectDaegu()throws Exception;
	public long selectGwangju()throws Exception;
	public long selectInchoen()throws Exception;
	public long selectDaejoen()throws Exception;
	public long selectUlsan()throws Exception;
	public long selectSejong()throws Exception;
	public long selectGyeongGi()throws Exception;
	public long selectGwanhwon()throws Exception;
	public long selectChungbuk()throws Exception;
	public long selectChungnam()throws Exception;
	public long selectJeonbuk()throws Exception;
	public long selectJeonnam()throws Exception;
	public long selectGyeongbuk()throws Exception;
	public long selectGyeongnam()throws Exception;
	public long selectJeju()throws Exception;
	
	
	public long allPoint()throws Exception;
	public long totalRefund()throws Exception;
	public List<Analysis> sumedMoney()throws Exception;
	public List<Analysis> sumedMoneyMonth()throws Exception;
	
	public long refundALl()throws Exception;
	public long chargeAll()throws Exception;
	
	public List<Analysis> selectUser()throws Exception;
	
	public List<Analysis>selectPoint(String userId)throws Exception;
}
