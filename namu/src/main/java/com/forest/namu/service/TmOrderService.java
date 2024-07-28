package com.forest.namu.service;


import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Point;
import com.forest.namu.domain.TmOrder;

public interface TmOrderService {

	public void insertTmOrder(TmOrder dto) throws Exception;
	public List<TmOrder> listTmOrder(long tboardNum);
	public List<TmOrder> listTmOrderByUserId(Map<String,Object> map);
	public void updateState(long applNum) throws Exception;
	public void updateComplete(long applNum)throws Exception;
	public void deleteTmOrder(long applNum) throws Exception;
	public void reqeustOrderByPoint(Point pto) throws Exception;
	public void refundPoint(Point pto) throws Exception;
}
