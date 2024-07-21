package com.forest.namu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.Profile;
import com.forest.namu.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService{
	
	@Autowired
	private MypageMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public Profile selectProfile(String userId) throws Exception {
		Profile userdto = null;
		
		try {
			userdto = mapper.selectProfile(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return userdto;
	}

	@Override
	public void insertPhoto(Profile dto, String pathname)throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			System.out.println("saveFilename:"+saveFilename);
			if (saveFilename != null) {
				dto.setPhoto(saveFilename);
				System.out.println("saveFilename:"+saveFilename);
				mapper.insertPhoto(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Profile selectPhoto(String userId) throws Exception {
		Profile dto = null;
		try {
			
			dto = mapper.selectPhoto(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Member getAddress(String userId) throws Exception {
		Member dto = null;
		try {
			dto = mapper.getAddress(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Member> selectSchedule(String userId) throws Exception {
		List<Member> list = null;
		
		try {
			list = mapper.selectSchedule(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Delivery> selectRider(String userId) throws Exception {
		List<Delivery> list = null;
		try {
			list = mapper.selectRider(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
