package com.forest.namu.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Point;

@Mapper
public interface PointMapper {
	public void insertPoint(Point dto)throws Exception;
	public int selectPoint(String userId)throws Exception;
	public long selectSeq()throws Exception;
}
