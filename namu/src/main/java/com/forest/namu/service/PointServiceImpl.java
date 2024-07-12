package com.forest.namu.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Point;
import com.forest.namu.mapper.PointMapper;

@Service
public class PointServiceImpl implements PointService{
	
	@Autowired
	private PointMapper mapper;

	@Override
	public void insertPoint(Point dto) throws Exception {
		try {
			long lastMoney = dto.getCurrentPoint()+dto.getPointVar();
			dto.setLastMoney(lastMoney);
			dto.setDescription("전자 결제");
			dto.setPointCate(0);
			
			mapper.insertPoint(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int selectPoint(String userId) throws Exception {
		int point = 0;
		try {
			point = mapper.selectPoint(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return point;
	}

	@Override
	public long selectSeq() throws Exception {
		long sequence = 0;
		try {
			sequence = mapper.selectSeq();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return sequence;
	}

	@Override
	public List<Point> selectCharge(String userId) throws Exception {
		List<Point> list = null;
		
		try {
			list = mapper.selectCharge(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
