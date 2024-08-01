package com.forest.namu.liveChat;

import javax.websocket.Session;

public class ConnectOwner {
	private String oidx;
	private String ownerName;
	private String roomName;
	private String uidx; // 채팅중인 유저
	private Session session;
	
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
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getUidx() {
		return uidx;
	}
	public void setUidx(String uidx) {
		this.uidx = uidx;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
}
