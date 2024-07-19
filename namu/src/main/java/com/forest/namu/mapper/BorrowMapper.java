package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.Borrow;

@Mapper
public interface BorrowMapper {
	
	public long borrowSeq();
	public void insertBorrow(Borrow dto) throws SQLException; // 등록
	public void insertBorrowFile(Borrow dto); // 이미지 등록
	
	public void updateBorrow(Borrow dto) throws SQLException; // 수정
	public void deleteBorrow(Borrow dto) throws SQLException; // 삭제
	
	public int dataCount(Map<String, Object> map);			// 개수 
	public List<Borrow> listBorrow(Map<String, Object>map);	// borrow 게시판 리스트
	public List<Borrow> listCategory(Map<String, Object>map);	// borrow 카테고리 리스트
	
	public Borrow findByCategory(long categoryNum);
	public List<Borrow> listBorrowCategory(long categoryNum);
	
	public Borrow findById(long num);						// 검색 찾기
	public void updateHitCount(long num) throws Exception;	// 조회수
	
	
	public void insertBorrowLike(Map<String, Object> map) throws SQLException;
	public void deleteBorrowLike(Map<String, Object> map) throws SQLException;
	public int	borrowLikeCount(long num);
	public Borrow userBorrowLiked(Map<String, Object> map);

}
