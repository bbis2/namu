package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Auction;

@Mapper
public interface AuctionMapper {
	public long auction_seq();
	public void insertAuction(Auction dto) throws SQLException;
	public void updateAuction(Auction dto) throws SQLException;
	public void deleteAuction(long num) throws SQLException;
	public List<Auction> listAuction(Map<String, Object> map);

	public List<Auction> listCategory();
	public int dataCount(Map<String, Object> map);
	public void updateHitCount(long num) throws SQLException;
	public Auction findById(long num);
	
	public int likeCount(Map<String, Object> map);
	public void insertAuctionLike(Map<String, Object> map) throws SQLException;
	public void deleteAuctionLike(Map<String, Object> map) throws SQLException;
	
	// 파일 추가, 삭제만(수정없음)
	public void insertAuctionFile(Auction dto) throws SQLException;
	public void deleteAuctionFile(long fileNum) throws SQLException;
	public List<Auction> listAuctionFile(long num);
	public Auction findByFileId(long num) throws SQLException;
	
	// 입찰하기
	public void insertBid(Map<String, Object> map) throws SQLException;
	// 유저별 경매 참여 금액
	public List<Auction> listBid(Map<String, Object> map);
	// 경매 입찰 최고가
	public Auction findByMaxBid(Map<String, Object> map);
	// 유저의 마지막 경매 내역
	public Auction findByUserBid(Map<String, Object> map);
	
	// 경매 상태변경
	public void updateAuctionState(Map<String, Object> map);
	// 낙찰자 
	public void updateBiddetailsApply(Map<String, Object> map);
	// 판매기간 종료 시, 상태 변경
	public void updateEndState();
}
