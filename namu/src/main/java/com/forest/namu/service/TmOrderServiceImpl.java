package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.domain.TmOrder;
import com.forest.namu.mapper.TmOrderMapper;

@Service
public class TmOrderServiceImpl implements TmOrderService{
	
	@Autowired
	private TmOrderMapper mapper;
	
	@Override
	public void insertTmOrder(TmOrder dto) throws Exception {
		try {
			mapper.insertTmOrder(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<TmOrder> listTmOrder(long tboardNum) {
		List<TmOrder> list=null;
		try {
			list = mapper.listTmOrder(tboardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TmOrder> listTmOrderByUserId(Map<String, Object> map) {
		List<TmOrder> list = null;
		try {
			list = mapper.listTmOrderByUserId(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateState(long applNum) throws Exception {
		try {
			mapper.updateState(applNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateComplete(long applNum) throws Exception {
		try {
			mapper.updateComplete(applNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteTmOrder(long applNum) throws Exception {
		try {
			mapper.deleteTmOrder(applNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
