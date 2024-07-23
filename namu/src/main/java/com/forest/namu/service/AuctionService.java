package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Auction;

public interface AuctionService {
	public void insertAuction(Auction dto, String pathname) throws Exception;
	public void updateAuction(Auction dto, String pathname) throws Exception;
	public void deleteAuction(long num, String pathname) throws Exception;
	public List<Auction> listAuction(Map<String, Object> map);
	public List<Auction> listCategory();

	public int dataCount(Map<String, Object> map);
	public void updateHitCount(long num) throws Exception;
	public Auction findById(long num);
	
	public int likeCount(Map<String, Object> map);
	public void insertAuctionLike(Map<String, Object> map) throws Exception;
	public void deleteAuctionLike(Map<String, Object> map) throws Exception;
	
	// 파일 추가, 삭제만(수정없음)
	public void insertAuctionFile(Auction dto) throws Exception;
	public void deleteAuctionFile(long fileNum) throws Exception;
	public List<Auction> listAuctionFile(long num);
	public Auction findByFileId(long num) throws Exception;

}
