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
	public void insertBid(Auction dto) throws SQLException;

}
