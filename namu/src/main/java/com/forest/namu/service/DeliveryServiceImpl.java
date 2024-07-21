package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Rider;
import com.forest.namu.mapper.DeliveryMapper;

@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Autowired
	private DeliveryMapper mapper;

	@Override
	public void insertDelivery(Delivery dto) throws Exception {
		try {
			mapper.insertDelivery(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<Delivery> listDelivery(Map<String, Object> map) {
		List<Delivery> list = null;
		try {
			list = mapper.listDelivery(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public long selectPoint(String userId) throws Exception {
		long money = 0;
		
		try {
			money = mapper.selectPoint(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return money;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Delivery findById(long num) {
		Delivery dto = null;
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Delivery findByPrev(Map<String, Object> map) {
		Delivery dto = null;
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Delivery findByNext(Map<String, Object> map) {
		Delivery dto = null;
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertRider(Rider dto) throws Exception {
		try {
			mapper.insertRider(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateDelivery(Delivery dto) throws Exception {
		try {
			mapper.updateDelivery(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


}
