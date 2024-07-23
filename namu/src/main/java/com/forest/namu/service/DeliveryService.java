package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Rider;

public interface DeliveryService {
	public void insertDelivery(Delivery dto)throws Exception;
	public List<Delivery> listDelivery(Map<String,Object> map);
	public int dataCount(Map<String, Object> map);
	public long selectPoint(String userId)throws Exception;
	
	public void updateHitCount(long num) throws Exception;
	public Delivery findById(long num);
	public Delivery findByPrev(Map<String, Object> map);
	public Delivery findByNext(Map<String, Object> map);
	
	public void insertRider(Rider dto)throws Exception;
	public void updateDelivery(Delivery dto)throws Exception;
	public long findAutowired(Delivery dto)throws Exception;
	public long countOk(Delivery dto)throws Exception;
	
	public void updateAuthor(Delivery dto,String path)throws Exception;

}
