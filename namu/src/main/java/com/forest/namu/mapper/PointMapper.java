package com.forest.namu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Point;

@Mapper
public interface PointMapper {
	public void insertPoint(Point dto)throws Exception;
	public int selectPoint(String userId)throws Exception;
	public long selectSeq()throws Exception;
	public List<Point> selectCharge(String userId)throws Exception;
	public List<Point> selectAll(String userId)throws Exception;
	public void insertRefund(Point dto)throws Exception;
	
	public void updatePoint(Point dto)throws Exception;
	public void insertPoint2(Point pto)throws Exception;
}
