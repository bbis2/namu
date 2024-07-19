package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Borrow;
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
			dto.setNum(seq);
			
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
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Borrow findByCategory(long categoryNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Borrow> listBorrowCategory(long categoryNum) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Borrow findById(long num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBorrowLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBorrowLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int borrowLikeCount(long num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Borrow userBorrowLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Borrow> listCategory(Map<String, Object> map) {
		List<Borrow> category = null;
		try {
			category = mapper.listCategory(map);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return category;
	}

}
