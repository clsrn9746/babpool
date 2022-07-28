package com.babpool.chatRoom.vo;

public class ChatRoomVO {
	private int chatRoomId;                 /* 대화방 번호 */
	private String chatRoomName;            /* 대화방 이름 */
	private String masterId;                
	private String chatPeople;              
	private int chatCount;
	
	public ChatRoomVO(int chatRoomId, String chatRoomName, String masterId, String chatPeople, int chatCount) {
		super();
		this.chatRoomId = chatRoomId;
		this.chatRoomName = chatRoomName;
		this.masterId = masterId;
		this.chatPeople = chatPeople;
		this.chatCount = chatCount;
	}

	@Override
	public String toString() {
		return "ChatRoomVO [chatRoomId=" + chatRoomId + ", chatRoomName=" + chatRoomName + ", masterId=" + masterId
				+ ", chatPeople=" + chatPeople + ", chatCount=" + chatCount + "]";
	}

	public int getChatRoomId() {
		return chatRoomId;
	}

	public void setChatRoomId(int chatRoomId) {
		this.chatRoomId = chatRoomId;
	}

	public String getChatRoomName() {
		return chatRoomName;
	}

	public void setChatRoomName(String chatRoomName) {
		this.chatRoomName = chatRoomName;
	}

	public String getMasterId() {
		return masterId;
	}

	public void setMasterId(String masterId) {
		this.masterId = masterId;
	}

	public String getChatPeople() {
		return chatPeople;
	}

	public void setChatPeople(String chatPeople) {
		this.chatPeople = chatPeople;
	}

	public int getChatCount() {
		return chatCount;
	}

	public void setChatCount(int chatCount) {
		this.chatCount = chatCount;
	}                  
	
	
	
	
}
