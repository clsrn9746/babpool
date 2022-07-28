package com.babpool.main.web;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.babpool.chatRoom.service.IChatRoomService;
import com.babpool.chatRoom.vo.ChatRoomVO;
import com.babpool.common.vo.SchedulePagingVO;
import com.babpool.common.vo.SearchVO;
import com.babpool.free.dao.IFreeBoardDao;
import com.babpool.free.vo.FreeBoardVO;
import com.babpool.main.dao.ICalendarDao;
import com.babpool.main.vo.CalendarVO;
import com.babpool.market.dao.IMarketDao;
import com.babpool.market.vo.MarketVO;
import com.babpool.member.vo.MemberVO;
import com.babpool.notice.service.INoticeService;
import com.babpool.notice.vo.NoticeVO;
@Controller
public class CalendarController {
	@Inject
	ICalendarDao calendarDao;
	@Inject
	INoticeService noticeService;
	
	@Inject
	IFreeBoardDao freeBoardDao;
	
	@Inject
	IMarketDao marketDao;
	
	@Inject
	IChatRoomService chatRoomService;
	
	
	@RequestMapping(value = "/main.do")
	public String calendarList(Model model, HttpServletRequest req, HttpSession session, @ModelAttribute("calendar")CalendarVO calendar
										, @ModelAttribute("paging")SchedulePagingVO paging) throws Exception {
		
		// 캘린더에 있는 일정 리스트
		List<CalendarVO> calendarList = calendarDao.getCalendarList();
		model.addAttribute("calendarList", calendarList);
		
		// 다가 오는 스케쥴 리스트
		// 전체 글 수 구함
		int totalRowCount = calendarDao.getTotalRowCount(paging);
		paging.setTotalRowCount(totalRowCount);
		paging.pageSetting();
		
		List<CalendarVO> scheduleList = calendarDao.getScheduleList(paging);
		model.addAttribute("scheduleList", scheduleList);
		
		// 메인 공지 게시판 리스트
		List<NoticeVO> mainNoticeList = noticeService.getMainNoticeList();
		model.addAttribute("mainNoticeList", mainNoticeList);
		// 메인 자유 게시판 리스트
		List<FreeBoardVO> mainFreeBoardList = freeBoardDao.getMainFreeBoardList();
		model.addAttribute("mainFreeBoardList", mainFreeBoardList);
		
		// 메인 장터 게시판 리스트
		List<MarketVO> mainMarketList = marketDao.getMainMarketList();
		model.addAttribute("mainMarketList", mainMarketList);
		
		return "main";
	}
	
	@RequestMapping(value = "/deleteCalendar.do")
	public String deleteCalendar(Model model, @ModelAttribute("calendar")CalendarVO calendar) {
		calendarDao.deleteCalendar(calendar);
		return "calendarDelete";
	}
	
	@RequestMapping(value= "/chatRoomRegist.do")
	public String chatRoomRegist(Model model, int chatCalNo) {
		CalendarVO chatCal = chatRoomService.getChatCal(chatCalNo);
		model.addAttribute("chatCal", chatCal);
		return "chat/chatRoomRegist";
	}
	
	@RequestMapping(value = "/calendar.do")
	@ResponseBody
	public String toCalendarList(HttpServletRequest request) throws Exception {
		String title = request.getParameter("title");
		String master = request.getParameter("master");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		String people = request.getParameter("people");
		String masterId = request.getParameter("masterId");
		String color = request.getParameter("backgroundcolor");
		
		CalendarVO calendar = new CalendarVO();
		calendar.setCalTitle(title);
		calendar.setCalNick(master);
		calendar.setCalStart(start);
		calendar.setCalEnd(end);
		calendar.setCalPeople(Integer.parseInt(people));
		calendar.setCalId(masterId);
		calendar.setCalColor(color);
		System.out.println(calendar.getCalColor());
		
		calendarDao.toCalendarList(calendar);
		
		return "main";
	}
	
	@RequestMapping(value = "/chatTemp")
	public String getChatCalendar(HttpServletRequest request, Model model) {
		
		List<CalendarVO> calTemp = calendarDao.getCalendarList();
		model.addAttribute("calTemp", calTemp);
		
		return "chatTemp";
	}
	
	
	
	
}