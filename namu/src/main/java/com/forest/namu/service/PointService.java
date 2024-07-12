package com.forest.namu.service;

import com.forest.namu.domain.Point;

public interface PointService {
	public void insertPoint(Point dto)throws Exception;
	public int selectPoint(String userId)throws Exception;
	public long selectSeq()throws Exception;
}
