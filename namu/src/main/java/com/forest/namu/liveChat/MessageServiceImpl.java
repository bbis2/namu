package com.forest.namu.liveChat;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.forest.namu.mapper.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageMapper mapper;
	
	@Override
	public void insertMessage(ChatMessage dto) throws Exception {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyMMdd");
			SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			SimpleDateFormat sdf4 = new SimpleDateFormat("a h:m");
			
			Date date = new Date();
			dto.setSendDate(sdf.format(date));
			dto.setSdate(sdf2.format(date));
			dto.setDateWeek(sdf3.format(date));
			dto.setStime(sdf4.format(date));
			
			mapper.insertMessage(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMessageUser(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMessageUser(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void updateMessageOwner(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMessageOwner(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<ChatMessage> listChatUser(Map<String, Object> map) {
		List<ChatMessage> list = null;
		
		try {
			list = mapper.listChatUser(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<ChatMessage> listUserMessage(Map<String, Object> map) {
		List<ChatMessage> list = null;
		
		try {
			list = mapper.listUserMessage(map);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyMMdd");
			SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			SimpleDateFormat sdf4 = new SimpleDateFormat("a h:m");
			
			for(ChatMessage dto : list) {
				Date date = sdf.parse(dto.getSendDate());
				
				dto.setSdate(sdf2.format(date));
				dto.setDateWeek(sdf3.format(date));
				dto.setStime(sdf4.format(date));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public ChatMessage lastUserMessage(Map<String, Object> map) {
		ChatMessage dto = null;
		
		try {
			dto = mapper.lastUserMessage(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
