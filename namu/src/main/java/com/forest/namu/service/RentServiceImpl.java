package com.forest.namu.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.Rent;
import com.forest.namu.mapper.RentMapper;

@Service
public class RentServiceImpl implements RentService {
	
	@Autowired
	private RentMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	final static Logger logger = LoggerFactory.getLogger(RentServiceImpl.class);

	@Override
	public void insertRent(Rent dto, String pathname) throws Exception {
		try {
			long seq = mapper.rentSeq();
			dto.setRentNum(seq);
			
			mapper.insertRent(dto);
			
			// 파일 업로드
			if(!dto.getImage().isEmpty()) {
				for(MultipartFile mf : dto.getImage()) {
					String imageFilename = fileManager.doFileUpload(mf, pathname);
					if(imageFilename == null) {
						continue;
					}
					dto.setImageFilename(imageFilename);
					
					mapper.insertRentFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}

	@Override
	public void updateRent(Rent dto, String pathname, List<Long> remainingImageNums) throws Exception {
	    try {
	        mapper.updateRent(dto);
	        
	        // 남아있는 이미지 번호와 일치하지 않는 이미지 삭제
	        mapper.deleteNonMatchingImages(dto.getRentNum(), remainingImageNums);
	        
	        // 새 파일이 업로드된 경우 추가
	        if(dto.getImage() != null && !dto.getImage().isEmpty()) {
	            for(MultipartFile mf : dto.getImage()) {
	                String imageFilename = fileManager.doFileUpload(mf, pathname);
	                if(imageFilename == null) {
	                    continue;
	                }
	                dto.setImageFilename(imageFilename);
	                
	                mapper.insertRentFile(dto);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	@Override
	public void deleteRent(long num, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<Rent> listFile = listRentImage(num);
			if(listFile != null) {
				for(Rent dto : listFile) {
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				}
			}
			Rent dto = findById(num);
			
			mapper.deleteRentFile(dto);
			mapper.deleteRentLike2(dto);
			mapper.deleteRent(dto);
			
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
	public List<Rent> listRent(Map<String, Object> map) {
		List<Rent> list = null;
		try {
			list = mapper.listRent(map);
			
			for(Rent dto : list) {
				map.put("num", dto.getRentNum());
				dto.setUserLiked(userRentLiked(map));
				dto.setLikeCount(rentLikeCount(dto.getRentNum()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Rent> listCategory() {
		List<Rent> category = null;
		try {
			category = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}

	@Override
	public List<Rent> listRentImage(long num) {
		List<Rent> listImage = null;
		
		try {
			listImage = mapper.listRentImage(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listImage;
	}

	@Override
	public List<Rent> listOtherPosts(Map<String, Object> map) {
	    List<Rent> list = null;
	    try {
	        list = mapper.listOtherPosts(map);
	        
	        for(Rent dto : list) {
	            map.put("num", dto.getRentNum());
	            dto.setUserLiked(userRentLiked(map));
	            dto.setLikeCount(rentLikeCount(dto.getRentNum()));
	        }
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

	@Override
	public List<Map<String, Object>> getWriterOtherPosts(String userId, long currentPostNum) {
		try {
	        List<Map<String, Object>> posts = mapper.selectWriterOtherPosts(userId, currentPostNum);
	        if (posts == null || posts.isEmpty()) {
	            logger.warn("No posts found for user: " + userId);
	        } else {
	            for (Map<String, Object> post : posts) {
	                // regDate를 String으로 변환
	                if (post.get("regDate") instanceof java.sql.Timestamp) {
	                    java.sql.Timestamp timestamp = (java.sql.Timestamp) post.get("regDate");
	                    post.put("regDate", new SimpleDateFormat("yyyy-MM-dd").format(timestamp));
	                }
	            }
	        }
	        return posts;
	    } catch (Exception e) {
	        logger.error("Error fetching writer's other posts", e);
	        return new ArrayList<>();
	    }
	}

	@Override
	public Member rentWriter(long num) {
		Member dto = null;
		
		try {
			dto = mapper.rentWriter(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Rent findById(long num) {
		Rent dto = null;
		
		try {
			dto = mapper.findById(num);
			dto.setLikeCount(rentLikeCount(num));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insertRentLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertRentLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteRentLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteRentLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int rentLikeCount(long num) {
		int result = 0;
		
		try {
			result = mapper.rentLikeCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userRentLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Rent dto = mapper.userRentLiked(map);
			if(dto != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
