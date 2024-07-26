package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.forest.namu.domain.Borrow;
import com.forest.namu.domain.Member;
import com.forest.namu.domain.Rent;

@Mapper
public interface RentMapper {

	public long rentSeq();
	public void insertRent(Rent dto) throws SQLException; 	// 등록
	public void insertRentFile(Rent dto); 					// 이미지 등록
	
	public void updateRent(Rent dto) throws SQLException; 		// 수정
	public void updateRentFile(Rent dto) throws SQLException; 	// 이미지 수정
	
	public void deleteRent(Rent dto) throws SQLException; 		// 삭제
	public void deleteRentFile(Rent dto) throws SQLException; 	// 이미지 삭제
	public void deleteRentLike2(Rent dto) throws SQLException;	// 찜삭제
	
	// 수정시 맞지 않는 이미지 제거
	public void deleteNonMatchingImages(@Param("rentNum") long rentNum, @Param("remainingImageNums") List<Long> remainingImageNums);
	
	public int dataCount(Map<String, Object> map);			// 개수 
	public List<Rent> listRent(Map<String, Object>map);		// borrow 게시판 리스트
	public List<Rent> listCategory();						// borrow 카테고리 리스트
	public List<Rent> listRentImage(long num); 				// article 갈때 이미지 목록
	public Member rentWriter(long num); 					// 작성자 정보
	
	// article 에서 다른글 가져오기
	public List<Rent> listOtherPosts(Map<String, Object> map); 
	
	// 글쓴이의 다른 글 가져오기
	public List<Map<String, Object>> selectWriterOtherPosts(@Param("userId") String userId, @Param("currentPostNum") long currentPostNum);
	
	public Rent findById(long num);							// 검색 찾기
	public void updateHitCount(long num) throws Exception;	// 조회수
	
	public void insertRentLike(Map<String, Object> map) throws SQLException; // 찜 삽입
	public void deleteRentLike(Map<String, Object> map) throws SQLException; // 찜 삭제
	public int rentLikeCount(long num);						// 찜 개수
	public Rent userRentLiked(Map<String, Object> map);		// 찜 여부
}
