package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.forest.namu.domain.BoardReply;
import com.forest.namu.domain.TogetherBoard;

@Mapper
public interface TogetherBoardMapper {
	public void insertTogetherBoard(TogetherBoard dto) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<TogetherBoard>listTogetherBoard(Map<String, Object>map);
	public TogetherBoard findById(long num); // 검색 찾기 (글 번호 던질 때 사용)
	
	public void updateTogetherBoard(TogetherBoard dto)throws SQLException;
	public void deleteTogetherBoard(long num) throws SQLException;
	
	
	// 파일
	public void insertTogetherBoardFile(TogetherBoard dto) throws SQLException;
	public List<TogetherBoard>listTogetherBoardFile(long num);
	public void deleteTogetherBoardFile(long num) throws SQLException;
	public TogetherBoard findByFileId(long num);
	
	public TogetherBoard userFreeBoardLiked(Map<String, Object> map);
	
	//댓글 
    public void insertReply(BoardReply dto) throws SQLException;
    public int replyCount(Map<String,Object> map);
    public List<BoardReply> listReply (Map<String, Object> map);
    public void deleteReply(Map<String, Object> map) throws SQLException;
    
    public List<BoardReply> listReplyAnswer(Map<String, Object>map);
    public int replyAnswerCount(Map<String, Object> map);
    
    // 댓글의 좋아요
    public void insertReplyLike(Map<String, Object> map) throws SQLException;
    public Map<String, Object> replyLikeCount(Map<String, Object> map);
	
	// 
    
}
