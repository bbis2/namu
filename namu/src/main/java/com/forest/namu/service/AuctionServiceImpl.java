package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Auction;
import com.forest.namu.mapper.AuctionMapper;

@Service
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private AuctionMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	
	@Override
	public void insertAuction(Auction dto, String pathname) throws Exception {

		try {
			long seq = mapper.auction_seq();
			
			dto.setaNum(seq);
			
			String saveFile = fileManager.doFileUpload(dto.getThumbFile(), pathname);

			if(saveFile != null) {
				dto.setImageFile(saveFile);
				
			} 
			
			mapper.insertAuction(dto);
			
			// 다중파일
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFile2 = fileManager.doFileUpload(mf, pathname);
					if(saveFile2 == null) {
						continue;
					}
					
					dto.setUploadFile(saveFile2);
					
					insertAuctionFile(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateAuction(Auction dto, String pathname) throws Exception {


		try {
			String saveFile = fileManager.doFileUpload(dto.getThumbFile(), pathname);
			
			if(saveFile != null) {
				if(dto.getImageFile().length() != 0) {
					fileManager.doFileDelete(dto.getImageFile(), pathname);
				}
				dto.setImageFile(saveFile);
			} 
			
			if(! dto.getSelectFile().isEmpty()) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String saveFile2 = fileManager.doFileUpload(mf, pathname);
					if(saveFile2 == null) {
						continue;
					}
					
					dto.setUploadFile(saveFile2);
					System.out.println("다중파일"+saveFile2);
					insertAuctionFile(dto);
				}
			}
			
			mapper.updateAuction(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteAuction(long num, String pathname) throws Exception {
		
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			mapper.deleteAuction(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Auction> listAuction(Map<String, Object> map) {
		List<Auction> list = null;
		
		try {
			list = mapper.listAuction(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Auction> listCategory() {
		List<Auction> list = null;
		
		try {
			list = mapper.listCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
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
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Auction findById(long num) {
		Auction dto = null;
		
		 try {
	            dto = mapper.findById(num);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
		return dto;
	}

	@Override
	public int likeCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.likeCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertAuctionLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertAuctionLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteAuctionLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteAuctionLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertAuctionFile(Auction dto) throws Exception {
		try {
			mapper.insertAuctionFile(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteAuctionFile(long fileNum) throws Exception {
		try {
			mapper.deleteAuctionFile(fileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Auction> listAuctionFile(long num) {
		List<Auction> list = null;
		
		try {
			list = mapper.listAuctionFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Auction findByFileId(long num) throws Exception {
		Auction dto = null;
		
		try {
			dto = mapper.findByFileId(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return dto;
	}

}
