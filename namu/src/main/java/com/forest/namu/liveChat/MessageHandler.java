package com.forest.namu.liveChat;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@ServerEndpoint(value = "/channel/{roomName}/{mode}", configurator = ServerEndpointConfigurator.class)
public class MessageHandler {
	private static final Logger logger = LoggerFactory.getLogger(MessageHandler.class);

	private static Map<String, ConnectUser> userSession = new Hashtable<>();
	private static Map<String, ConnectOwner> ownerSession = new Hashtable<>();

	@Autowired
	private MessageService messageService;

	@OnOpen
	public void open(Session session, EndpointConfig config, @PathParam("roomName") String roomName,
			@PathParam("mode") String mode) {
		logger.info("client connect ...");
	}

	// Text 메시지를 받는 경우
	@OnMessage
	public void onMessage(Session session, String message, @PathParam("roomName") String roomName,
			@PathParam("mode") String mode) {

		if (mode.equals("user")) { // 일반 유저
			userService(session, roomName, message);
		} else if (mode.equals("owner")) { // 오너
			ownerService(session, roomName, message);
		}
	}

	@OnClose
	public void close(Session session, CloseReason reason, @PathParam("roomName") String roomName,
			@PathParam("mode") String mode) {
		if (mode.equals("user")) { // 일반 유저
			removeUser(session);
		} else if (mode.equals("owner")) { // 오너
			removeOwner(session);
		}

		logger.info("client disConnect : " + reason.getReasonPhrase());
	}

	@OnError
	public void error(Session session, Throwable t, @PathParam("roomName") String roomName,
			@PathParam("mode") String mode) {
		t.printStackTrace();
	}

	// -----------------------------------------------------
	// 오너 영역
	protected void ownerService(Session session, String roomName, String message) {
		JSONObject jsonReceive = null;

		try {
			jsonReceive = new JSONObject(message);

			String type = jsonReceive.getString("type");
			if (type == null || type.equals("")) {
				return;
			}

			if (type.equals("connect")) {
				// 채팅창에 접속한 경우
				ownerConnect(session, roomName, jsonReceive);
			} else if (type.equals("answer")) {
				// 오너가 답변을 등록한 경우
				ownerAnswer(session, roomName, jsonReceive);
			} else if (type.equals("startChatting")) {
				// 유저와 채팅을 시작한 경우
				ownerUserStartChatting(session, roomName, jsonReceive);
			} else if (type.equals("endChatting")) {
				// 유저와 채팅을 종료한 경우
				ownerUserEndChatting(session, roomName, jsonReceive);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 오너 - 접속한 경우
	protected void ownerConnect(Session session, String roomName, JSONObject jsonReceive) {
		// 접속한 사용자의 아이디를 키로 session과 유저 정보를 Map에 저장

		if (getConnectionOwner(roomName) != null) {
			return;
		}

		String oidx = jsonReceive.getString("oidx");
		String userName = jsonReceive.getString("userName");

		ConnectOwner owner = new ConnectOwner();
		owner.setOidx(oidx);
		owner.setOwnerName(userName);
		owner.setRoomName(roomName);
		owner.setSession(session);

		ownerSession.put(oidx, owner);

		// 룸의 유저 정보
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roomName", roomName);
		List<ChatMessage> listUsers = messageService.listChatUser(map);

		// 오너에게 온라인 / 오프라인 유저 전송
		JSONObject jsonSend = new JSONObject();
		jsonSend.put("type", "connectOk");

		JSONArray onlineUsers = new JSONArray();
		JSONArray offlineUsers = new JSONArray();

		int unread;
		for (ChatMessage dto : listUsers) {
			// 답변하지 않는 질문 존재 유무
			unread = dto.getReadIdx() == null && dto.getClassify() == 1 ? 1 : 0;

			JSONObject job = new JSONObject();
			job.put("uidx", dto.getUserIdx());
			job.put("userName", dto.getUserName());
			job.put("content", dto.getContent());
			job.put("unread", unread);
			job.put("dateTime", dto.getSdate());

			if (userSession.containsKey(dto.getUserIdx())) {
				onlineUsers.put(job);
			} else {
				offlineUsers.put(job);
			}
		}
		jsonSend.put("onlineUsers", onlineUsers);
		jsonSend.put("offlineUsers", offlineUsers);

		sendTextMessageToOne(jsonSend.toString(), session); // 오너에게 전송

		// 룸의 온라인 유저에게 실시간 상담 가능 상태를 알림
		JSONObject jsonSend2 = new JSONObject();
		jsonSend2.put("type", "consult");
		jsonSend2.put("state", 1);

		sendMessageToRoomUser(roomName, jsonSend2.toString(), null); // 유저에게 전송
	}

	// 오너 - 문의에 대한 답변
	protected void ownerAnswer(Session session, String roomName, JSONObject jsonReceive) {
		try {
    		ConnectOwner owner = getConnectionOwner(session);
    		
    		if(owner == null) {
    			return;
    		}
    		
    		String uidx = jsonReceive.getString("uidx");
    		String userName = jsonReceive.getString("userName");
    		String answer = jsonReceive.getString("answer");
    		
			ConnectUser user = userSession.get(uidx);
    		ChatMessage msg = new ChatMessage();
    		
    		msg.setRoomName(roomName);
    		msg.setOwnerIdx(owner.getOidx());
    		msg.setFromIdx(owner.getOidx());
    		msg.setFromName(owner.getOwnerName());
    		msg.setClassify(2);
    		msg.setToIdx(uidx);
    		msg.setToName(userName);
    		msg.setContent(answer);
    		
    		if(user != null && owner.getUidx().equals(uidx)) {
    			// 오너와 유저가 채팅중인 경우 읽은 상태로 만듬
    			msg.setReadIdx(uidx);
    		}
    		
			// 답변 사항을 테이블에 저장
    		messageService.insertMessage(msg);
    		
    		// 오너와 유저가 채팅중인 상태이면 유저에게 답변 전송
			int unread = 1;
			if(user != null && owner.getUidx() != null && owner.getUidx().equals(uidx)) {
				unread = 0;
				
				JSONObject jsonSend = new JSONObject();
	    		jsonSend.put("type", "answerOk");
				
				JSONObject job = new JSONObject();
   				job.put("fromIdx", msg.getFromIdx());
   				job.put("fromName", msg.getFromName());
   				job.put("classify", msg.getClassify());
   				job.put("toIdx", msg.getToIdx());
   				job.put("toName", msg.getToName());
   				job.put("content", msg.getContent());
   				job.put("readIdx", msg.getReadIdx());
   				job.put("date", msg.getSdate());
   				job.put("dateWeek", msg.getDateWeek());
   				job.put("time", msg.getStime());
   				
   				jsonSend.put("answer", job);
   				
   				sendTextMessageToOne(jsonSend.toString(), user.getSession());
			}
    		
			// 오너에게 답변 등록완료 전달
			JSONObject jsonSend2 = new JSONObject();
    		jsonSend2.put("type", "answerOk");
    		jsonSend2.put("unread", unread);
    		sendTextMessageToOne(jsonSend2.toString(), session);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 오너 - 유저와 채팅을 시작 하는 경우
	protected void ownerUserStartChatting(Session session, String roomName, JSONObject jsonReceive) {
    	try {
    		ConnectOwner owner = getConnectionOwner(session);
    		if(owner == null) {
    			return;
    		}
    		
    		String uidx = jsonReceive.getString("uidx");
    		
    		ConnectUser user = userSession.get(uidx);
    		
    		JSONObject jsonSend = new JSONObject();
    		jsonSend.put("type", "startChatting");
    		if(user == null) {
    			jsonSend.put("userOnline", 0);
    		} else {
    			owner.setUidx(uidx);
    			jsonSend.put("userOnline", 1);
    		}
    		
    		// 유저와 오너의 메시지를 오너에게 전송
    		Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			String date = sdf.format(now);
			String fullDate = sdf2.format(now);
    		jsonSend.put("nowDate", date);
    		jsonSend.put("nowFullDate", fullDate);
    		
			// 유저의 메시지를 읽은 상태로 변경
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("readIdx", owner.getOidx());
			map.put("roomName", roomName);
			map.put("userIdx", uidx);
			messageService.updateMessageOwner(map);
			
			// 최근 5일 이내의 메시지를 전송
			LocalDate todayLocalDate = LocalDate.now();
			LocalDate localDate = todayLocalDate.minusDays(5);
			String startDate = localDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
			map.put("date", startDate);
			
			List<ChatMessage> listUserMessage = messageService.listUserMessage(map);
			JSONArray arrMsg = new JSONArray();

			for (ChatMessage msg : listUserMessage) {
				JSONObject job = new JSONObject();

				job.put("fromIdx", msg.getFromIdx());
				job.put("fromName", msg.getFromName());
				job.put("classify", msg.getClassify());
				job.put("toIdx", msg.getToIdx());
				job.put("toName", msg.getToName());
				job.put("content", msg.getContent());
				job.put("readIdx", msg.getReadIdx());
				job.put("date", msg.getSdate());
				job.put("dateWeek", msg.getDateWeek());
				job.put("time", msg.getStime());

				arrMsg.put(job);
			}
			jsonSend.put("startDate", startDate); // 메시지 출력 시작일
			jsonSend.put("messageList", arrMsg);

    		sendTextMessageToOne(jsonSend.toString(), session);
    		
    		// 오너의 상담 유저 변경
    		owner.setUidx(uidx);
    		
    		// 유저에게 실시간 상담 시작을 알림
    		if(user != null) {
    			JSONObject jsonSend2 = new JSONObject();
    			jsonSend2.put("type", "realTimeConsult");
    			jsonSend2.put("ownerName", owner.getOwnerName());
    			jsonSend2.put("userName", user.getUserName());
    			jsonSend2.put("state", 1);	
    			sendTextMessageToOne(jsonSend2.toString(), user.getSession());
    		}
    		
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 오너 - 유저와 채팅을 종료 한 경우
	protected void ownerUserEndChatting(Session session, String roomName, JSONObject jsonReceive) {
    	try {
    		ConnectOwner owner = getConnectionOwner(session);
    		if(owner == null) {
    			return;
    		}
    		
    		String uidx = jsonReceive.getString("uidx");
    		
    		// 오너의 채팅 유저 제거
    		owner.setUidx(null);
    		
    		ConnectUser user = userSession.get(uidx);
    		if(user == null) {
    			return;
    		}

    		// 유저에게 실시간 상담 종료를 전송
    		JSONObject jsonSend = new JSONObject();
    		jsonSend.put("type", "realTimeConsult");
    		jsonSend.put("userName", user.getUserName());
    		jsonSend.put("state", 0);
    		
    		sendTextMessageToOne(jsonSend.toString(), user.getSession());
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 오너 - 채팅방을 나간 경우
	protected String removeOwner(Session session) {
		try {
			ConnectOwner owner = getConnectionOwner(session);
			if (owner != null) {
				// 오너가 접속 해제 한 경우
				owner.getSession().close();
				ownerSession.remove(owner.getOidx());

				// 룸의 온라인 유저에게 실시간 상담이 불가능한 상태임을 알림
				JSONObject jsonSend = new JSONObject();
				jsonSend.put("type", "consult");
				jsonSend.put("state", 0);
				sendMessageToRoomUser(owner.getRoomName(), jsonSend.toString(), null);

				return owner.getOidx();
			}
		} catch (Exception e) {
		}

		return null;
	}

	// session에 해당하는 오너 정보
	protected ConnectOwner getConnectionOwner(Session session) {
		Iterator<String> it = ownerSession.keySet().iterator();

		while (it.hasNext()) {
			String key = it.next();

			ConnectOwner owner = ownerSession.get(key);
			if (owner.getSession() == session) {
				return owner;
			}
		}

		return null;
	}

	// roomName에 해당하는 오너 정보
	protected ConnectOwner getConnectionOwner(String roomName) {
		Iterator<String> it = ownerSession.keySet().iterator();

		while (it.hasNext()) {
			String key = it.next();

			ConnectOwner owner = ownerSession.get(key);
			if (owner.getRoomName().equals(roomName)) {
				return owner;
			}
		}

		return null;
	}

	// -----------------------------------------------------
	// 일반 유저 영역
	protected void userService(Session session, String roomName, String message) {
		JSONObject jsonReceive = null;

		try {
			jsonReceive = new JSONObject(message);

			String type = jsonReceive.getString("type");
			if (type == null || type.equals("")) {
				return;
			}

			if (type.equals("connect")) {
				// 채팅창에 접속한 경우
				userConnect(session, roomName, jsonReceive);

			} else if (type.equals("question")) {
				// 문의를 한 경우
				userQuestion(session, roomName, jsonReceive);
			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	// 유저 - 채팅창에 접속한 경우
	protected void userConnect(Session session, String roomName, JSONObject jsonReceive) {
		try {
			// 접속한 사용자의 아이디를 키로 session과 유저 정보를 Map에 저장
			String uidx = jsonReceive.getString("uidx");
			String userName = jsonReceive.getString("userName");
			String oidx = jsonReceive.getString("oidx");
			String ownerName = jsonReceive.getString("ownerName");

			if (uidx == null || uidx.length() == 0 || userName == null || userName.length() < 2) {
				return;
			}

			ConnectUser connUser = new ConnectUser();
			connUser.setUidx(uidx);
			connUser.setUserName(userName);
			connUser.setRoomName(roomName);
			connUser.setOidx(oidx);
			connUser.setOwnerName(ownerName);
			connUser.setSession(session);

			userSession.put(uidx, connUser);

			JSONObject jsonSend = new JSONObject();
			jsonSend.put("type", "connectOk");

			Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			String date = sdf.format(now);
			String fullDate = sdf2.format(now);
			jsonSend.put("nowDate", date);
			jsonSend.put("nowFullDate", fullDate);

			// 유저의 메시지의 답변을 읽은 상태로 변경
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("readIdx", uidx);
			map.put("roomName", roomName);
			map.put("userIdx", uidx);
			messageService.updateMessageUser(map);

			// 최근 5일 이내의 메시지를 전송
			LocalDate todayLocalDate = LocalDate.now();
			LocalDate localDate = todayLocalDate.minusDays(5);
			String startDate = localDate.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
			map.put("date", startDate);

			List<ChatMessage> listUserMessage = messageService.listUserMessage(map);
			JSONArray arrMsg = new JSONArray();

			for (ChatMessage msg : listUserMessage) {
				JSONObject job = new JSONObject();

				job.put("fromIdx", msg.getFromIdx());
				job.put("fromName", msg.getFromName());
				job.put("classify", msg.getClassify());
				job.put("toIdx", msg.getToIdx());
				job.put("toName", msg.getToName());
				job.put("content", msg.getContent());
				job.put("readIdx", msg.getReadIdx());
				job.put("date", msg.getSdate());
				job.put("dateWeek", msg.getDateWeek());
				job.put("time", msg.getStime());

				arrMsg.put(job);
			}
			jsonSend.put("startDate", startDate); // 메시지 출력 시작일
			jsonSend.put("messageList", arrMsg);

			// 오너가 온라인 상태인지 유무 전송
			ConnectOwner owner = getConnectionOwner(roomName);
			if (owner == null) {
				jsonSend.put("realTime", 0);
			} else {
				jsonSend.put("realTime", 1);
			}
			sendTextMessageToOne(jsonSend.toString(), session);

			// 오너에게 유저의 connect 사실 전송
			if (owner == null) {
				return;
			}
			
			JSONObject jsonSend2 = new JSONObject();
			jsonSend2.put("type", "userConn");
			jsonSend2.put("uidx", uidx);
			jsonSend2.put("userName", userName);
			
			sendTextMessageToOne(jsonSend2.toString(), owner.getSession());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 유저 - 문의를 한 경우
	protected void userQuestion(Session session, String roomName, JSONObject jsonReceive) {
		ConnectUser user = getConnectionUser(session);
		if (user == null) {
			return;
		}

		try {
			String inquiry = jsonReceive.getString("inquiry");
			ConnectOwner owner = getConnectionOwner(roomName);

			ChatMessage msg = new ChatMessage();
			msg.setRoomName(roomName);
			msg.setOwnerIdx(user.getOidx());
			msg.setFromIdx(user.getUidx());
			msg.setFromName(user.getUserName());
			msg.setToIdx(user.getOidx());
			msg.setToName(user.getOwnerName());
			msg.setContent(inquiry);
			msg.setClassify(1);
			
			int unread = 1;
			if(owner != null && owner.getUidx() != null && owner.getUidx().equals(user.getUidx())) {
				// 유저와 채팅 중인 경우
				unread = 0;
				msg.setReadIdx(user.getOidx());
			}

			// 테이블에 저장
			messageService.insertMessage(msg);
			
			// 오너가 로그인 상태이면 오너에게 전송
			if (owner != null) {
				JSONObject jsonSend = new JSONObject();
				jsonSend.put("type", "inquiry");

				JSONObject job = new JSONObject();
				job.put("fromIdx", msg.getFromIdx());
				job.put("fromName", msg.getFromName());
				job.put("classify", msg.getClassify());
				job.put("content", msg.getContent());
				job.put("date", msg.getSdate());
				job.put("dateWeek", msg.getDateWeek());
				job.put("time", msg.getStime());

				jsonSend.put("msg", job);
				sendTextMessageToOne(jsonSend.toString(), owner.getSession());
			}

			// 유저에게 메시지 등록 상태 전송
			JSONObject jsonSend2 = new JSONObject();
			jsonSend2.put("type", "inquiryOk");
			jsonSend2.put("unread", unread);

			sendTextMessageToOne(jsonSend2.toString(), session);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	// 유저 - 채팅방을 나간 경우
	protected String removeUser(Session session) {
		try {
			ConnectUser user = getConnectionUser(session);
			if (user != null) {
				// 유저가 접속 해제 한 경우
				user.getSession().close();
				userSession.remove(user.getUidx());

				ConnectOwner owner = getConnectionOwner(user.getRoomName());
				if (owner != null) {
					// 오너에게 접속 해제 사실을 알림
					JSONObject jsonSend = new JSONObject();
					jsonSend.put("type", "userDisConn");
					jsonSend.put("uidx", user.getUidx());
					jsonSend.put("userName", user.getUserName());

					sendTextMessageToOne(jsonSend.toString(), owner.getSession());
				}

				return user.getUidx();
			}
		} catch (Exception e) {
		}

		return null;
	}

	// session에 해당하는 유저 정보
	protected ConnectUser getConnectionUser(Session session) {
		Iterator<String> it = userSession.keySet().iterator();

		while (it.hasNext()) {
			String key = it.next();

			ConnectUser user = userSession.get(key);
			if (user.getSession() == session) {
				return user;
			}
		}

		return null;
	}

	// 접속한 룸의 모든 유저에게 메시지 전송
	protected void sendMessageToRoomUser(String roomName, String message, String exclude) {
		Iterator<String> it = userSession.keySet().iterator();

		while (it.hasNext()) {
			String key = it.next();
			if (exclude != null && exclude == key) {
				continue;
			}

			ConnectUser user = userSession.get(key);
			if (user.getRoomName().equals(roomName)) {
				Session session = user.getSession();
				try {
					if (session.isOpen()) {
						session.getBasicRemote().sendText(message);
					}
				} catch (IOException e) {
				}
			}
		}
	}

	// -----------------------------------------------------
	// 특정 사용자에게 텍스트 전송
	protected void sendTextMessageToOne(String message, Session session) {
		if (session.isOpen()) {
			try {
				session.getBasicRemote().sendText(message);
			} catch (Exception e) {
				logger.error("fail to send message!", e);
			}
		}
	}

}
