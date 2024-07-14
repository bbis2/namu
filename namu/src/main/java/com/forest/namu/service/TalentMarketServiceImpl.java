package com.forest.namu.service;

import java.util.ArrayList;
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
		try {
		 
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(filename);	
			
			long tboardNum= mapper.talentSeq();
			dto.setTboardNum(tboardNum);
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
			
			if(dto.getOptionCount()>0) {
				insertTalentOption(dto);
			}
	
		}	catch (Exception e) {
			e.printStackTrace();
			throw e;
	}
		
	}
	
	@Override
	public void insertTalentOption(TalentMarket dto) throws Exception {
		try {
			long optionNum = 0, optionNum2 = 0;
			long detailNum;
			
			// 옵션1 추가 -----
			if(dto.getOptionCount() > 0) {
				optionNum = mapper.optionSeq();
				dto.setOptionNum(optionNum);
				dto.setParentOption(null);
				mapper.insertTalentOption(dto);
				
				// 옵션1 값 추가
				dto.setDetailNums(new ArrayList<Long>());
				for(String optionValue : dto.getOptionValues()) {
					detailNum = mapper.detailSeq(); 
					dto.setDetailNum(detailNum);
					dto.setOptionValue(optionValue);
	
					mapper.insertOptionDetail(dto);
					
					dto.getDetailNums().add(detailNum);
				}
			}
			
			// 옵션2 추가 -----
			if(dto.getOptionCount() > 1) {
				optionNum2 = mapper.optionSeq();
				dto.setOptionNum(optionNum2);
				dto.setOptionName(dto.getOptionName2());
				dto.setParentOption(optionNum);
				mapper.insertTalentOption(dto);
				
				// 옵션 2 값 추가
				dto.setDetailNums2(new ArrayList<Long>());
				for(String optionValue2 : dto.getOptionValues2()) {
					detailNum = mapper.detailSeq(); 
					dto.setDetailNum(detailNum);
					dto.setOptionValue(optionValue2);
					mapper.insertOptionDetail(dto);
					
					dto.getDetailNums2().add(detailNum);
				}
			}
		} catch (Exception e) {
			throw e;
		}
		
	}

	@Override
	public void updateTalent(TalentMarket dto , String pathname) throws Exception {
		try {
			String filename = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			
			if(filename != null) {
				if (dto.getThumbnail().length() != 0) {
					fileManager.doFileDelete(dto.getThumbnail(), pathname);
				}
				
				dto.setThumbnail(filename);
			}
			
			mapper.updateTalent(dto);
			
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
			
			//윱션 수정
			
			updateTalentOption(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void updateTalentOption(TalentMarket dto) throws Exception {
		try {
		if(dto.getOptionCount() == 0) {
			// 기존 옵션1, 옵션2 삭제
			if(dto.getPrevOptionNum2() != 0) {
				mapper.deleteOptionDetail2(dto.getPrevOptionNum2());
				mapper.deleteTalentOption(dto.getPrevOptionNum2());
			}
			
			if(dto.getPrevOptionNum() != 0) {
				mapper.deleteOptionDetail2(dto.getPrevOptionNum());
				mapper.deleteTalentOption(dto.getPrevOptionNum());
			}
			
			return;
		} else if(dto.getOptionCount() == 1) {
			// 기존 옵션 2 삭제
			if(dto.getPrevOptionNum2() != 0) {
				mapper.deleteOptionDetail2(dto.getPrevOptionNum2());
				mapper.deleteTalentOption(dto.getPrevOptionNum2());
			}
		}
		
		long detailNum, parentNum;
		
		// 옵션1 -----
		// 옵션1이 없는 상태에서 옵션1을 추가한 경우
		if(dto.getOptionNum() == 0) {
			insertTalentOption(dto);
			return;
		}
		// 옵션1이 존재하는 경우 옵션1 수정
		mapper.updateTalentOption(dto);
		
		// 기존 옵션1 옵션값 수정
		int size = dto.getDetailNums().size();
		for(int i = 0; i < size; i++) {
			dto.setDetailNum(dto.getDetailNums().get(i));
			dto.setOptionValue(dto.getOptionValues().get(i));
			mapper.updateOptionDetail(dto);
		}

		// 새로운 옵션1 옵션값 추가
		dto.setDetailNums(new ArrayList<Long>());
		for(int i = size; i < dto.getOptionValues().size(); i++) {
			detailNum = mapper.detailSeq(); 
			dto.setDetailNum(detailNum);
			dto.setOptionValue(dto.getOptionValues().get(i));
			mapper.insertOptionDetail(dto);
			
			dto.getDetailNums().add(detailNum);
		}

		// 옵션2 -----
		if(dto.getOptionCount() > 1) {
			//  옵션2가 없는 상태에서 옵션2를 추가한 경우
			parentNum = dto.getOptionNum(); // 옵션1 옵션번호 
			if(dto.getOptionNum2() == 0) {
				long optionNum2 = mapper.optionSeq();
				dto.setOptionNum(optionNum2);
				dto.setOptionName(dto.getOptionName2());
				dto.setParentOption(parentNum);
				mapper.insertTalentOption(dto);
				
				// 옵션 2 값 추가
				dto.setDetailNums2(new ArrayList<Long>());
				for(String optionValue2 : dto.getOptionValues2()) {
					detailNum = mapper.detailSeq(); 
					dto.setDetailNum(detailNum);
					dto.setOptionValue(optionValue2);
					mapper.insertOptionDetail(dto);
					
					dto.getDetailNums2().add(detailNum);
				}
				
				return;
			} 
			
			// 옵션2 가 존재하는 경우 옵션2 수정
			dto.setOptionNum(dto.getOptionNum2());
			dto.setOptionName(dto.getOptionName2());
			mapper.updateTalentOption(dto);
			
			// 기존 옵션2 옵션값 수정
			int size2 = dto.getDetailNums2().size();
			for(int i = 0; i < size2; i++) {
				dto.setDetailNum(dto.getDetailNums2().get(i));
				dto.setOptionValue(dto.getOptionValues2().get(i));
				mapper.updateOptionDetail(dto);
			}

			// 새로운 옵션2 옵션값 추가
			dto.setDetailNums2(new ArrayList<Long>());
			for(int i = size2; i < dto.getOptionValues2().size(); i++) {
				detailNum = mapper.detailSeq(); 
				dto.setDetailNum(detailNum);
				dto.setOptionValue(dto.getOptionValues2().get(i));
				mapper.insertOptionDetail(dto);
				
				dto.getDetailNums2().add(detailNum);
			}
		}
	} catch (Exception e) {
		throw e;
	}
		
}

	@Override
	public void deleteTalent(long tboardNum, String pathname) throws Exception {
		
					// 파일 삭제(thumbnail)

					// 추가 파일 삭제
					
					// 재고 삭제

					// 옵션2 삭제
					
					// 옵션1 삭제
					
					// 상품 삭제
					mapper.deleteTalent(tboardNum);
		
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
