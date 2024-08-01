package com.forest.namu.liveChat;

import javax.websocket.Session;

public class ConnectUser {
	private String uidx;
	private String userName;
	private String roomName;
	private String oidx;
	private String ownerName;
	private Session session;
	
	public String getUidx() {
		return uidx;
	}
	public void setUidx(String uidx) {
		this.uidx = uidx;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getOidx() {
		return oidx;
	}
	public void setOidx(String oidx) {
		this.oidx = oidx;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
}
