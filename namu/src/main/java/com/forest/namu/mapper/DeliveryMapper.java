package com.forest.namu.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Rider;


@Mapper
public interface DeliveryMapper {
	public void insertDelivery(Delivery dto)throws Exception;
	public List<Delivery> listDelivery(Map<String,Object> map);
	public int dataCount(Map<String, Object> map);
	public long selectPoint(String userId)throws Exception;
	
	public void updateHitCount(long num) throws Exception;
	public Delivery findById(long num);
	public Delivery findByPrev(Map<String, Object> map);
	public Delivery findByNext(Map<String, Object> map);
	
	public long updateDelivery(Delivery dto)throws Exception;
	
	public void insertRider(Rider dto)throws Exception;
	public long findAutowired(Delivery dto)throws Exception;
	public long countOk(Delivery dto)throws Exception;
	
	public void updateAuthor(Delivery dto)throws Exception;
	public void riderState(Delivery dto)throws Exception;
}
