package com.babpool.chat.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.babpool.chatRoom.dao.IChatRoomDao;
import com.babpool.chatRoom.service.IChatRoomService;
import com.babpool.chatRoom.vo.ChatRoomVO;
import com.babpool.main.dao.ICalendarDao;
import com.babpool.main.vo.CalendarVO;
import com.babpool.member.dao.MemberDao;
import com.babpool.member.vo.MemberVO;


@Controller
public class ControllerView {
	
	
	@Inject
	ICalendarDao calendarDao;
	
	/*
	 * @Inject IChatRoomService chatRoomService;
	 */
	
	/*
	 * @Inject MemberDao memberDao;
	 */
//	, MemberVO vo
	// 채팅방 입장
	
	/*
	 * @Autowired MemberDao memberDao;
	 */
	@RequestMapping(value = "/chat.do", method = RequestMethod.GET)
	public String view_chat(HttpServletRequest request, HttpServletResponse response, Model model
			, int calNo) throws Exception {
		CalendarVO calendar = calendarDao.getChatCalendar(calNo);
		model.addAttribute("calendar", calendar);
		
		/*
		 * String memberId = calendar.getCalId(); MemberVO member =
		 * memberDao.getMemberbyId(memberId); String memberImg = member.getMemProfile();
		 * model.addAttribute("profile", memberImg);
		 */
		/*
		 * MemberVO memberInfo = memberDao.getMember(vo);
		 * model.addAttribute("memberInfo", memberInfo);
		 */
		
		
		return "view_chat";
	}
	
	/*
	 * @RequestMapping(value = "/chatRoomRegist.do") public String
	 * insertCharRoom(Model model, @ModelAttribute("chatRoom")ChatRoomVO chatRoom) {
	 * 
	 * }
	 */
	
	
}