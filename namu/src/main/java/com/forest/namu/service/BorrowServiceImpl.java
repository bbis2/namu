package com.forest.namu.service;

import java.util.List;
import java.util.Map;

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
	public void updateBorrow(Borrow dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBorrow(Borrow dto) throws Exception {
		// TODO Auto-generated method stub
		
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
	public Borrow findById(long num) {
		Borrow dto = null;
		
		try {
			dto = mapper.findById(num);
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
			// TODO: handle exception
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
