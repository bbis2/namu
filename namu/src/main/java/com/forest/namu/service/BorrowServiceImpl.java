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
import com.forest.namu.domain.Borrow;
import com.forest.namu.domain.Member;
import com.forest.namu.mapper.BorrowMapper;

@Service
public class BorrowServiceImpl implements BorrowService {

	@Autowired
	private BorrowMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	final static Logger logger = LoggerFactory.getLogger(BorrowServiceImpl.class);

	@Override
	public void insertBorrow(Borrow dto, String pathname) throws Exception {
		try {
			long seq = mapper.borrowSeq();
			dto.setBorrowNum(seq);
			
			dto.setStrDate(dto.getStrDate().replace("T", " "));
			dto.setEndDate(dto.getEndDate().replace("T", " "));
			
			mapper.insertBorrow(dto);
			
			// 파일 업로드
			if(!dto.getImage().isEmpty()) {
				for(MultipartFile mf : dto.getImage()) {
					String imageFilename = fileManager.doFileUpload(mf, pathname);
					if(imageFilename == null) {
						continue;
					}
					dto.setImageFilename(imageFilename);
					
					mapper.insertBorrowFile(dto);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateBorrow(Borrow dto, String pathname, List<Long> remainingImageNums) throws Exception {
	    try {
	        dto.setStrDate(dto.getStrDate().replace("T", " "));
	        dto.setEndDate(dto.getEndDate().replace("T", " "));
	        
	        mapper.updateBorrow(dto);
	        
	        // 남아있는 이미지 번호와 일치하지 않는 이미지 삭제
	        mapper.deleteNonMatchingImages(dto.getBorrowNum(), remainingImageNums);
	        
	        // 새 파일이 업로드된 경우 추가
	        if(dto.getImage() != null && !dto.getImage().isEmpty()) {
	            for(MultipartFile mf : dto.getImage()) {
	                String imageFilename = fileManager.doFileUpload(mf, pathname);
	                if(imageFilename == null) {
	                    continue;
	                }
	                dto.setImageFilename(imageFilename);
	                
	                mapper.insertBorrowFile(dto);
	            }
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        throw e;
	    }
	}

	@Override
	public void deleteBorrow(long num, String pathname) throws Exception {
		try {
			// 파일 지우기
			List<Borrow> listFile = listBorrowImage(num);
			if(listFile != null) {
				for(Borrow dto : listFile) {
					fileManager.doFileDelete(dto.getImageFilename(), pathname);
				}
			}
			Borrow dto = findById(num);
			
			mapper.deleteBorrowFile(dto);
			mapper.deleteBorrowLike2(dto);
			mapper.deleteBorrow(dto);
			
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
	public List<Borrow> listBorrow(Map<String, Object> map) {
		List<Borrow> list = null;
		try {
			list = mapper.listBorrow(map);
			
			for(Borrow dto : list) {
				map.put("num", dto.getBorrowNum());
				dto.setUserLiked(userBorrowLiked(map));
				dto.setLikeCount(borrowLikeCount(dto.getBorrowNum()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Borrow> listOtherPosts(Map<String, Object> map) {
	    List<Borrow> list = null;
	    try {
	        list = mapper.listOtherPosts(map);
	        
	        for(Borrow dto : list) {
	            map.put("num", dto.getBorrowNum());
	            dto.setUserLiked(userBorrowLiked(map));
	            dto.setLikeCount(borrowLikeCount(dto.getBorrowNum()));
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
	public Borrow findById(long num) {
		Borrow dto = null;
		
		try {
			dto = mapper.findById(num);
			dto.setLikeCount(borrowLikeCount(num));
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
	public void insertBorrowLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertBorrowLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void deleteBorrowLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteBorrowLike(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int borrowLikeCount(long num) {
		int result = 0;
		
		try {
			result = mapper.borrowLikeCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userBorrowLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Borrow dto = mapper.userBorrowLiked(map);
			if(dto != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Borrow> listCategory() {
		List<Borrow> category = null;
		try {
			category = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}

	@Override
	public List<Borrow> listBorrowImage(long num) {
		List<Borrow> listImage = null;
		
		try {
			listImage = mapper.listBorrowImage(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return listImage;
	}

	@Override
	public Member borrowWriter(long num) {
		Member dto = null;
		
		try {
			dto = mapper.borrowWriter(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
