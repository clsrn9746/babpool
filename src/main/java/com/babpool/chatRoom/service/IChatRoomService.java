package com.babpool.chatRoom.service;

import java.util.List;

import com.babpool.chatRoom.vo.ChatRoomVO;
import com.babpool.main.vo.CalendarVO;

public interface IChatRoomService {
	public void insertChatRoom(ChatRoomVO chatRoom);
	
	public CalendarVO getChatCal(int chatCalNo);
}
