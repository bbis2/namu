package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Member;
import com.forest.namu.domain.Rent;

public interface RentService {
	
	// 등록
	public void insertRent(Rent dto, String pathname) throws Exception;
	// 수정
	public void updateRent(Rent dto, String pathname, List<Long> remainingImageNums) throws Exception;
	// 삭제
	public void deleteRent(long num, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);			// 개수 
	public List<Rent> listRent(Map<String, Object> map);	// borrow 게시판 리스트
	public List<Rent> listCategory();						// borrow 카테고리
	public List<Rent> listRentImage(long num); 			// borrow 이미지 가져오기
	
	// 아티클에서 다른글 가져오기
	public List<Rent> listOtherPosts(Map<String, Object> map);
	// 글쓴이의 다른 글 가져오기
	public List<Map<String, Object>> getWriterOtherPosts(String userId, long currentPostNum); 
	
	public Member rentWriter(long num); // 작성자 정보
	
	public Rent findById(long num);						// 검색 찾기
	public void updateHitCount(long num) throws Exception;	// 조회수
	
	public void insertRentLike(Map<String, Object> map) throws Exception; // 찜
	public void deleteRentLike(Map<String, Object> map) throws Exception; // 찜삭제
	public int	rentLikeCount(long num);								  // 찜개수
	public boolean userRentLiked(Map<String, Object> map);				  // 찜 여부
}
