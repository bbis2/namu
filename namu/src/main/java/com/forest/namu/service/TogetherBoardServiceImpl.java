package com.forest.namu.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.forest.namu.common.FileManager;
import com.forest.namu.common.MyUtil;
import com.forest.namu.domain.BoardReply;
import com.forest.namu.domain.TogetherBoard;
import com.forest.namu.mapper.TogetherBoardMapper;

@Service
public class TogetherBoardServiceImpl implements TogetherBoardService {
	
	@Autowired
	private TogetherBoardMapper mapper;

	@Autowired
	private FileManager fileManager;
	
	@Autowired
	private MyUtil myUtil;
	
	@Override
	public void insertTogetherBoard(TogetherBoard dto, String pathname) throws Exception {
		try {
			mapper.insertTogetherBoard(dto);
			
			if( ! dto.getSelectFile().isEmpty() ) {
				for(MultipartFile mf : dto.getSelectFile()) {
					String filename = fileManager.doFileUpload(mf, pathname);
					if(filename != null) {
						dto.setFilename(filename);
						
						mapper.insertTogetherBoardFile(dto);
					}
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<TogetherBoard> listTogetherBoard(Map<String, Object> map) {
		List<TogetherBoard> list = null;
		
		try {
			list = mapper.listTogetherBoard(map);
			
			String s;
			for (TogetherBoard dto : list) {
				if(dto.getFilename() != null) {
					dto.setListFilename(dto.getFilename().split(",")); 
				}
				
				s = dto.getNickName().substring(0, 1);
				if(dto.getNickName().length() <= 2) {
					s += "*";
				} else {
					s += dto.getNickName().substring(2, dto.getNickName().length()).replaceAll(".", "*");
				}
				s += dto.getNickName().substring(dto.getNickName().length()-1);
				dto.setNickName(s);
				
				dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public void updateTogetherBoard(TogetherBoard dto) throws Exception {
		try {
			mapper.updateTogetherBoard(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteTogetherBoard(long num, String pathname) throws Exception {
		try {
			List<TogetherBoard> listFile = mapper.listTogetherBoardFile(num);
			if (listFile != null) {
				for (TogetherBoard dto : listFile) {
					fileManager.doFileDelete(dto.getFilename(), pathname);
				}
			}
			
			mapper.deleteTogetherBoard(num);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void insertReply(BoardReply dto) throws Exception {
		try {
			mapper.insertReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<BoardReply> listReply(Map<String, Object> map) {
	List<BoardReply> list = null;
		
		try {
			list = mapper.listReply(map);
			for(BoardReply dto : list) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public int replyCount(Map<String, Object> map) {
	int result = 0;
		
		try {
			result = mapper.replyCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteReply(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public List<BoardReply> listReplyAnswer(Map<String, Object> map) {
		List<BoardReply> list = null;
		
		try {
			list = mapper.listReplyAnswer(map);
			for(BoardReply dto : list) {
				dto.setContent(myUtil.htmlSymbols(dto.getContent()));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int replyAnswerCount(Map<String, Object> map) {
	int result = 0;
		
		try {
			result = mapper.replyAnswerCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result ;
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertReplyLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = mapper.replyLikeCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return countMap;
	}

	@Override
	public boolean userFreeBoardLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			TogetherBoard dto = mapper.userFreeBoardLiked(map);
			if(dto != null) {
				result =true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertTogetherBoardFile(TogetherBoard dto) throws Exception {
		
		try {
			mapper.insertTogetherBoardFile(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<TogetherBoard> listTogetherBoardFile(long num) {
		
		List<TogetherBoard> list = null;
		
		try {
			list = mapper.listTogetherBoardFile(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteTogetherBoardFile(long fileNum, String pathname) throws Exception {
		
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			
			mapper.deleteTogetherBoardFile(fileNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public TogetherBoard findByFileId(long num) throws Exception {
		
		TogetherBoard dto = null;
		
		try {
			dto = mapper.findByFileId(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}

	@Override
	public TogetherBoard findById(long num) {
		TogetherBoard dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}




}
