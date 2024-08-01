package com.forest.namu.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.forest.namu.liveChat.ChatMessage;

public interface MessageMapper {
	public void insertMessage(ChatMessage dto) throws SQLException;
	
	public void updateMessageUser(Map<String, Object> map) throws SQLException;
	public void updateMessageOwner(Map<String, Object> map) throws SQLException;
	
	public List<ChatMessage> listChatUser(Map<String, Object> map);
	public List<ChatMessage> listUserMessage(Map<String, Object> map);
	public ChatMessage lastUserMessage(Map<String, Object> map);
}
