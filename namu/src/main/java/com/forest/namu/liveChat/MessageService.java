package com.forest.namu.liveChat;

import java.util.List;
import java.util.Map;

public interface MessageService {
	public void insertMessage(ChatMessage dto) throws Exception;
	
	public void updateMessageUser(Map<String, Object> map) throws Exception;
	public void updateMessageOwner(Map<String, Object> map) throws Exception;
	
	public List<ChatMessage> listChatUser(Map<String, Object> map);
	public List<ChatMessage> listUserMessage(Map<String, Object> map);
	public ChatMessage lastUserMessage(Map<String, Object> map);
}
