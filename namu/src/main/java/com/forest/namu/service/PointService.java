package com.forest.namu.service;

import java.util.List;

import com.forest.namu.domain.Point;

public interface PointService {
	public void insertPoint(Point dto)throws Exception;
	public int selectPoint(String userId)throws Exception;
	public long selectSeq()throws Exception;
	public List<Point> selectCharge(String userId)throws Exception;
	public List<Point> selectAll(String userId)throws Exception;
	
	public void insertRefund(Point dto)throws Exception;
	//환불한 포인트를 통장에 기록
	public void refundPoint(Point dto)throws Exception;
	public void pointMinus(Point dto) throws Exception;
	public void insertPoint2(Point pto)throws Exception;
	
}
