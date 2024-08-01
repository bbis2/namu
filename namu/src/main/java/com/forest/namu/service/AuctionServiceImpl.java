package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.common.FileManager;
import com.forest.namu.domain.Auction;
import com.forest.namu.domain.Point;
import com.forest.namu.mapper.AuctionMapper;

@Service
public class AuctionServiceImpl implements AuctionService {

	@Autowired
	private AuctionMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private PointService pointService;	
	
	@Override
	public void insertAuction(Auction dto, String pathname) throws Exception {

		try {
			long seq = mapper.auction_seq();
			
			dto.setaNum(seq);
			
			String saveFile = fileManager.doFileUpload(dto.getThumbFile(), pathname);

			if(saveFile != null) {
				dto.setImageFile(saveFile);
				
			} 
			
			dto.setSalesStart(dto.getStartDate() + " " + dto.getStartTime() + ":00");
			dto.setSalesEnd(dto.getEndDate() + " " + dto.getEndTime() + ":00");
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
			
			dto.setSalesStart(dto.getStartDate() + " " + dto.getStartTime() + ":00");
			dto.setSalesEnd(dto.getEndDate() + " " + dto.getEndTime() + ":00");
			
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
	            
				dto.setStartDate(dto.getSalesStart() .substring(0, 10));
				dto.setStartTime(dto.getSalesStart().substring(11));
				
				dto.setEndDate(dto.getSalesEnd().substring(0, 10));
				dto.setEndTime(dto.getSalesEnd().substring(11));
				
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

	@Override
	public void insertBid(Map<String, Object> map) throws Exception {

		try {
			mapper.insertBid(map);
			
			String userId = (String)map.get("userId");
			Auction maxAuction = (Auction)map.get("maxAuction");
			long userPoint = (Long)map.get("userPoint");
			long bid = (Long)map.get("bid");
			long pbid = (Long)map.get("pbid"); // 이전 입찰금액
			
			// 내포인트 변동
			Point pdto = new Point();
			pdto.setPointNum(pointService.selectSeq());
			pdto.setUserId(userId);
			pdto.setDescription("경매 참여");
			pdto.setCurrentPoint(userPoint);
			pdto.setPointVar(bid - pbid);
			pdto.setPointCate(2);
			pointService.pointMinus(pdto);
			
			if(maxAuction != null && ! maxAuction.getUserId().equals(userId)) {
				// 다른 유저는 환불
				pdto = new Point();
				pdto.setUserId(maxAuction.getUserId());
				pdto.setDescription("경매 환뷸");
				pdto.setCurrentPoint(userPoint);
				pdto.setPointVar(maxAuction.getBid());
				pdto.setPointCate(1);
				pointService.insertPoint2(pdto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Auction> listBid(Map<String, Object> map) {
		List<Auction> list = null;
		
		try {
			list = mapper.listBid(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Auction findByMaxBid(Map<String, Object> map) {
		Auction dto = null;
		
		try {
			dto = mapper.findByMaxBid(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Auction findByUserBid(Map<String, Object> map) {
		Auction dto = null;
		
		try {
			dto = mapper.findByUserBid(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void updateAuctionState(Map<String, Object> map) {

		try {
			int state = (Integer)map.get("state");
			if(state == 2) {
				// 경매 금액 환불처리
				Auction dto = findByMaxBid(map);
				long userPoint = 0;
				try {
					userPoint = pointService.selectPoint(dto.getUserId());		
				} catch (Exception e) {
				}				
				
				Point pdto = new Point();
				pdto.setUserId(dto.getUserId());
				pdto.setDescription("경매 취소");
				pdto.setCurrentPoint(userPoint);
				pdto.setPointVar(dto.getBid());
				pdto.setPointCate(1);
				pointService.insertPoint2(pdto);
			}
			
			mapper.updateAuctionState(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateBiddetailsApply(Map<String, Object> map) {

		try {
			mapper.updateBiddetailsApply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateEndState() {

		try {
			mapper.updateEndState();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
