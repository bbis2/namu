package com.forest.namu.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.RentCR;
import com.forest.namu.mapper.RentCRMapper;

@Service
public class RentCRServiceImpl implements RentCRService {
	
	@Autowired
	private RentCRMapper mapper;

	@Override
	public void insertRentConfirm(RentCR dto) throws Exception {
		try {
			
			dto.setReqNum(mapper.rentConfirmSeq());
			mapper.insertRentConfirm(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
}
