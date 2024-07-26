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
	
	// 입찰하기
	public void insertBid(Map<String, Object> map) throws Exception;
	// 유저별 경매 참여 금액
	public List<Auction> listBid(Map<String, Object> map);
	// 경매 입찰 최고가
	public Auction findByMaxBid(Map<String, Object> map);
	// 유저의 마지막 경매 내역
	public Auction findByUserBid(Map<String, Object> map);
	// 경매완료
	public void auctionSold(Auction dto) throws Exception;
}
