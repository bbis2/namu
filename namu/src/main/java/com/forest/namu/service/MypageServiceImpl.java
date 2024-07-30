package com.forest.namu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Delivery;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.Profile;
import com.forest.namu.domain.Url;
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

	@Override
	public void updateRider(Delivery dto) throws Exception {
		try {
			mapper.updateRider1(dto);
			mapper.updateRider2(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Delivery> waitRider(String userId) throws Exception {
		List<Delivery> list = null;
		
		try {
			mapper.waitRider(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateRider2(Delivery dto) throws Exception {
		try {
			mapper.updateRider3(dto);
			mapper.updateRider4(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<Url> myWrite(String userId) throws Exception {
		List<Url> list = null;
		try {
			list = mapper.myWrite(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Url> myWrite2(String userId) throws Exception {
		List<Url> list = null;
		try {
			list = mapper.myWrite2(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Url> myGGim(String userId) throws Exception {
		List<Url> list = null;
		try {
			list = mapper.myGGim(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Url> myGGim2(String userId) throws Exception {
		List<Url> list = null;
		try {
			list = mapper.myGGim2(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public long selectMessage(String userId) throws Exception {
		long result = 0;
		try {
			result = mapper.selectMessage(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
