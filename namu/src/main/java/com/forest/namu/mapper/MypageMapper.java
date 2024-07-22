package com.forest.namu.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.Profile;

@Mapper
public interface MypageMapper {
	public Profile selectProfile(String userId)throws Exception;
	public void insertPhoto(Profile dto);
	public Profile selectPhoto(String userId)throws Exception;
	public Member getAddress(String userId)throws Exception;
	public List<Member> selectSchedule(String userId)throws Exception;
	public List<Delivery> selectRider(String userId)throws Exception;
	public void updateRider1(Delivery dto)throws Exception;
	public void updateRider2(Delivery dto)throws Exception;
	public void updateRider3(Delivery dto)throws Exception;
	public void updateRider4(Delivery dto)throws Exception;
	public List<Delivery> waitRider(String userId)throws Exception;
}
