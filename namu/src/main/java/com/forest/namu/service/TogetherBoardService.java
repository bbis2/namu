package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import com.forest.namu.domain.BoardReply;
import com.forest.namu.domain.TogetherBoard;

public interface TogetherBoardService {

	public void insertTogetherBoard(TogetherBoard dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<TogetherBoard>listTogetherBoard(Map<String, Object>map);
	public TogetherBoard findById(long num);
	
	public void updateTogetherBoard(TogetherBoard dto)throws Exception;
	public void deleteTogetherBoard(long num, String pathname) throws Exception;
	
	public boolean userFreeBoardLiked(Map<String, Object> map);
	
	// 파일
	public void insertTogetherBoardFile(TogetherBoard dto) throws Exception;
	public List<TogetherBoard> listTogetherBoardFile(long num);
	public void deleteTogetherBoardFile(long fileNum, String pathname) throws Exception;
	public TogetherBoard findByFileId(long num) throws Exception;
	
    
    // 댓글
    public void insertReply(BoardReply dto) throws Exception;
    public List<BoardReply> listReply (Map<String, Object> map);
    public int replyCount(Map<String, Object> map);
    public void deleteReply(Map<String, Object> map) throws Exception;
    
    public List<BoardReply> listReplyAnswer(Map<String, Object> map);
    public int replyAnswerCount(Map<String,Object> map);
    
    public void insertReplyLike(Map<String, Object> map) throws Exception;
    public Map<String, Object> replyLikeCount(Map<String, Object> map);

    public void deleteBoard(Map<String, Object> map) throws Exception;
}
