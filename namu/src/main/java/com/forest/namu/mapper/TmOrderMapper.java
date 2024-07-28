package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.TmOrder;

@Mapper
public interface TmOrderMapper {
	
	public void insertTmOrder(TmOrder dto) throws SQLException;
	
	
	public List<TmOrder> listTmOrder(long tboardNum);
	public List<TmOrder> listTmOrderByUserId(Map<String,Object> map);
	public void updateState(long applNum) throws SQLException;
	public void updateComplete(long applNum)throws SQLException;
	public void deleteTmOrder(long applNum) throws SQLException;
	public void updateReviewState(long applNum) throws SQLException;
	public void updateReviewState0(long applNum) throws SQLException;
}
