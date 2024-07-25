package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.Borrow;
import com.forest.namu.domain.Member;

public interface BorrowService {

	public void insertBorrow(Borrow dto, String pathname) throws Exception; // 등록
	public void updateBorrow(Borrow dto, String pathname, List<Long> remainingImageNums) throws Exception; // 수정
	public void deleteBorrow(long num, String pathname) throws Exception; // 삭제
	
	public int dataCount(Map<String, Object> map);			// 개수 
	public List<Borrow> listBorrow(Map<String, Object> map);	// borrow 게시판 리스트
	public List<Borrow> listCategory();	// borrow 카테고리
	public List<Borrow> listBorrowImage(long num); // borrow 이미지 가져오기
	
	public List<Borrow> listOtherPosts(Map<String, Object> map); // 아티클에서 다른글 가져오기
	public List<Map<String, Object>> getWriterOtherPosts(String userId, long currentPostNum); // 글쓴이의 다른 글 가져오기
	
	public Member borrowWriter(long num); // 작성자 정보
	
	public Borrow findById(long num);						// 검색 찾기
	public void updateHitCount(long num) throws Exception;	// 조회수
	
	
	public void insertBorrowLike(Map<String, Object> map) throws Exception;
	public void deleteBorrowLike(Map<String, Object> map) throws Exception;
	public int	borrowLikeCount(long num);
	public boolean userBorrowLiked(Map<String, Object> map);
	
}
