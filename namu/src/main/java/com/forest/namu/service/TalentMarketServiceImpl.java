package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.TalentMarket;
import com.forest.namu.mapper.TalentMarketMapper;

@Service
public class TalentMarketServiceImpl implements TalentMarketService{
	@Autowired
	private TalentMarketMapper mapper;

	@Autowired
	private FileManager fileManager;

	@Override
	public void insertTalent(TalentMarket dto,String pathname) throws Exception {
		String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
		dto.setThumbnail(filename);	
		
		long tboardNum= mapper.talentSeq();
		mapper.insertTalent(dto);
		
		if(! dto.getAddFiles().isEmpty()) {
			for(MultipartFile mf : dto.getAddFiles()) {
				filename = fileManager.doFileUpload(mf, pathname);
				if(filename == null) {
					continue;
				}
				dto.setFilename(filename);
				
				mapper.insertTalentFile(dto);
			}
		}
		
		
	}

	@Override
	public void insertTalentFile(TalentMarket dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateTalent(TalentMarket dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTalent(long tboardNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteTalentFile(long fileNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TalentMarket> listTalentMarket(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TalentMarket findById(long tboardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TalentMarket> listTalentMarketFile(long tboardNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<TalentMarket> listCategory() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
