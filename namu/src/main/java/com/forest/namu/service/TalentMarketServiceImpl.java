package com.forest.namu.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
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
		 
			String fileName = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			dto.setThumbnail(fileName);	
			
			long tboardNum= mapper.talentSeq();
			dto.setTboardNum(tboardNum);
			mapper.insertTalent(dto);
			
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					fileName = fileManager.doFileUpload(mf, pathname);
					if(fileName == null) {
						continue;
					}
					dto.setFileName(fileName);
					
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
			
			//옵션1
			if(dto.getOptionCount() > 0) {
				optionNum = mapper.optionSeq();
				dto.setOptionNum(optionNum);
				dto.setParentOption(null);
				mapper.insertTalentOption(dto);
				
				// 옵션1 값
				dto.setDetailNums(new ArrayList<Long>());
				for(String optionValue : dto.getOptionValues()) {
					detailNum = mapper.detailSeq(); 
					dto.setDetailNum(detailNum);
					dto.setOptionValue(optionValue);
	
					mapper.insertOptionDetail(dto);
					
					dto.getDetailNums().add(detailNum);
				}
			}
			
			// 옵션2
			if(dto.getOptionCount() > 1) {
				optionNum2 = mapper.optionSeq();
				dto.setOptionNum(optionNum2);
				dto.setOptionName(dto.getOptionName2());
				dto.setParentOption(optionNum);
				mapper.insertTalentOption(dto);
				
				// 옵션 2 값
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
			String fileName = fileManager.doFileUpload(dto.getThumbnailFile(), pathname);
			
			if(fileName != null) {
				if (dto.getThumbnail().length() != 0) {
					fileManager.doFileDelete(dto.getThumbnail(), pathname);
				}
				
				dto.setThumbnail(fileName);
			}
			
			mapper.updateTalent(dto);
			
			if(! dto.getAddFiles().isEmpty()) {
				for(MultipartFile mf : dto.getAddFiles()) {
					fileName = fileManager.doFileUpload(mf, pathname);
					if(fileName == null) {
						continue;
					}
					dto.setFileName(fileName);
					
					mapper.insertTalentFile(dto);
				}
			}
			
			
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
			
			if(dto.getPrevOptionNum2() != 0) {
				mapper.deleteOptionDetail2(dto.getPrevOptionNum2());
				mapper.deleteTalentOption(dto.getPrevOptionNum2());
			}
		}
		
		long detailNum, parentNum;
		
		if(dto.getOptionNum() == 0) {
			insertTalentOption(dto);
			return;
		}
		
		mapper.updateTalentOption(dto);
		
		
		int size = dto.getDetailNums().size();
		for(int i = 0; i < size; i++) {
			dto.setDetailNum(dto.getDetailNums().get(i));
			dto.setOptionValue(dto.getOptionValues().get(i));
			mapper.updateOptionDetail(dto);
		}

		dto.setDetailNums(new ArrayList<Long>());
		for(int i = size; i < dto.getOptionValues().size(); i++) {
			detailNum = mapper.detailSeq(); 
			dto.setDetailNum(detailNum);
			dto.setOptionValue(dto.getOptionValues().get(i));
			mapper.insertOptionDetail(dto);
			
			dto.getDetailNums().add(detailNum);
		}

		
		if(dto.getOptionCount() > 1) {
			
			parentNum = dto.getOptionNum(); 
			if(dto.getOptionNum2() == 0) {
				long optionNum2 = mapper.optionSeq();
				dto.setOptionNum(optionNum2);
				dto.setOptionName(dto.getOptionName2());
				dto.setParentOption(parentNum);
				mapper.insertTalentOption(dto);
				
				
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
			
			
			dto.setOptionNum(dto.getOptionNum2());
			dto.setOptionName(dto.getOptionName2());
			mapper.updateTalentOption(dto);
			
			
			int size2 = dto.getDetailNums2().size();
			for(int i = 0; i < size2; i++) {
				dto.setDetailNum(dto.getDetailNums2().get(i));
				dto.setOptionValue(dto.getOptionValues2().get(i));
				mapper.updateOptionDetail(dto);
			}

			
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
	public void deleteTalent(long tboardNum) throws Exception {
		try {
			mapper.deleteTalent(tboardNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteTalentByAdmin(long tboardNum, String pathname) throws Exception {
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("tboardNum", tboardNum);
					TalentMarket talent = mapper.findById(map);
					
					// 파일 삭제(thumbnail)
					if(talent !=null && talent.getThumbnail() != null) {
						File file = new File(pathname,talent.getThumbnail());
						if(file.exists()) {
							file.delete();
						}
					}
					// 추가 파일 삭제
					
					  List<TalentMarket> files = mapper.listTalentMarketFile(tboardNum);
				        for (TalentMarket file : files) {
				            String filePath = pathname + File.separator + file.getFileName();
				            deleteTalentFile(file.getFileNum(), filePath);
				        }

				        List<TalentMarket> options = mapper.listTalentOption(tboardNum);
				        for (TalentMarket option : options) {
				            // 옵션2 삭제
				            List<TalentMarket> optionDetails = mapper.listOptionDetail(option.getOptionNum());
				            for (TalentMarket detail : optionDetails) {
				                deleteOptionDetail(detail.getDetailNum());
				            }
				            // 옵션1 삭제
				            mapper.deleteTalentOption(option.getOptionNum());
				        }
				        
				        
					// 상품 삭제
					mapper.deleteTalent(tboardNum);
		
	}

	@Override
	public void deleteTalentFile(long fileNum, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}

			mapper.deleteTalentFile(fileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void deleteOptionDetail(long detailNum) throws Exception {
		try {
			mapper.deleteOptionDetail(detailNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
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
	public List<TalentMarket> listTalentMarket(Map<String, Object> map) {
		List<TalentMarket> list = null;
		
		try {
			list = mapper.listTalentMarket(map);
			
			for(TalentMarket dto : list) {
				map.put("tboardNum", dto.getTboardNum());
				dto.setUserLiked(userTalentLiked(map));
				dto.setLikeCount(talentLikeCount(dto.getTboardNum()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public TalentMarket findById(Map<String, Object> map) {
		TalentMarket dto = null;
		
		try {
			dto = mapper.findById(map);
			dto.setUserLiked(userTalentLiked(map));
			dto.setLikeCount(talentLikeCount(dto.getTboardNum()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<TalentMarket> listTalentMarketFile(long tboardNum) {
		List<TalentMarket> list = null;
		
		try {
			list = mapper.listTalentMarketFile(tboardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TalentMarket> listCategory() {
		List<TalentMarket> list = null;
		
		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<TalentMarket> listType() {
		List<TalentMarket> list = null;
		
		try {
			list = mapper.listType();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TalentMarket> listTalentOption(long productNum) {
		List<TalentMarket> list = null;
		
		try {
			list = mapper.listTalentOption(productNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<TalentMarket> listOptionDetail(long optionNum) {
		List<TalentMarket> list = null;
		
		try {
			list = mapper.listOptionDetail(optionNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
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
	public TalentMarket findByCategory(long categoryNum) {
		TalentMarket dto = null;
		
		try {
			dto = mapper.findByCategory(categoryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertTalentLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertTalentLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteTalentLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteTalentLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public int talentLikeCount(long tboardNum) {
		int result = 0;
		
		try {
			result = mapper.talentLikeCount(tboardNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userTalentLiked(Map<String, Object> map) {
		boolean result = false;
		
		try {
			TalentMarket dto= mapper.userTalentLiked(map);
			if(dto!=null) {
				result =true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}



	
	

	

}
