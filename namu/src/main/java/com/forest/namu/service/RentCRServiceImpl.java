package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Point;
import com.forest.namu.domain.RentCR;
import com.forest.namu.mapper.RentCRMapper;

@Service
public class RentCRServiceImpl implements RentCRService {
	
	@Autowired
	private RentCRMapper mapper;

	@Transactional(rollbackOn = Exception.class)
	@Override
	public void insertRentConfirm(RentCR dto, Point point) throws Exception {
		try {
			
			dto.setReqNum(mapper.rentConfirmSeq());
			
			long lastMoney = point.getCurrentPoint() - point.getPointVar();
			if (lastMoney < 0) {
				return;
			}
			point.setDescription("빌려드림 보증금 납입");
			point.setPointCate(2);
			point.setLastMoney(lastMoney);


			mapper.insertRentConfirm(dto);
			mapper.depositProcess(point);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public boolean checkRentOverlap(Map<String, Object> map) throws Exception {
		// 중복 검사 로직 구현
		return mapper.checkRentOverlap(map) > 0;
	}

	@Transactional(rollbackOn = Exception.class)
	@Override
	public void cancelRent(Map<String, Object> map, Point point) throws Exception {
		try {
			// 대여 신청 취소 로직 구현
			long deposit = mapper.getDeposit(map);
			long lastMoney = point.getCurrentPoint() + deposit;
			
			point.setDescription("빌려드림 보증금 반환(취소)");
			point.setPointVar(deposit);
			point.setPointCate(0);
			point.setLastMoney(lastMoney);
			
			mapper.depositProcess(point);
			
			mapper.cancelRent(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// rentController에서 article로 갈때 신청 상태 확인
	@Override
	public RentCR checkState(Map<String, Object> map) throws Exception {
		RentCR dto = null;
		try {
			dto = mapper.checkState(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}
	
    @Override
    public List<RentCR> getMyApplications(String userId) throws Exception {
        return mapper.selectMyApplications(userId);
    }

    @Override
    public List<RentCR> getReceivedRequests(String userId) throws Exception {
        return mapper.selectReceivedRequests(userId);
    }

    @Transactional(rollbackOn = Exception.class)
	@Override
	public void rejectRentRequest(Map<String, Object> map) throws Exception {
		try {
			
			Point point = mapper.getPoint((long)map.get("reqNum"));
			
			point.setLastMoney(point.getCurrentPoint() + point.getPointVar());
			point.setDescription("빌려드림 보증금 반환(거절)");
			point.setPointCate(0);
			
			mapper.depositProcess(point);
			
			mapper.rejectRentRequest(map);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
