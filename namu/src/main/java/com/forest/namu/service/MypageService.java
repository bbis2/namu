package com.forest.namu.service;

import java.util.List;

import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.Profile;
import com.forest.namu.domain.Url;

public interface MypageService {
	public Profile selectProfile(String userId)throws Exception;
	public void insertPhoto(Profile dto, String pathname) throws Exception;
	public Profile selectPhoto(String userId)throws Exception;
	public Member getAddress(String userId)throws Exception;
	public List<Member> selectSchedule(String userId)throws Exception;
	public List<Delivery> selectRider(String userId)throws Exception;
	public void updateRider(Delivery dto)throws Exception;
	public void updateRider2(Delivery dto)throws Exception;
	public List<Delivery> waitRider(String userId)throws Exception;
	
	public List<Url> myWrite(String userId)throws Exception;
	public List<Url> myWrite2(String userId)throws Exception;
	
	public List<Url> myGGim(String userId)throws Exception;
	public List<Url> myGGim2(String userId)throws Exception;
	public long selectMessage(String userId)throws Exception;
}
