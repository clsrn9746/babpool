package com.babpool.chatRoom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babpool.chatRoom.dao.IChatRoomDao;
import com.babpool.chatRoom.vo.ChatRoomVO;
import com.babpool.main.vo.CalendarVO;

@Service
public class ChatRoomServiceImpl implements IChatRoomService{
	
	@Inject
	IChatRoomDao chatRoomDao;
	
	@Override
	public void insertChatRoom(ChatRoomVO chatRoom) {
		chatRoomDao.insertChatRoom(chatRoom);
		
	}

	@Override
	public CalendarVO getChatCal(int chatCalNo) {
		CalendarVO chatCal = chatRoomDao.getChatCal(chatCalNo);
		return chatCal;
	}


}
