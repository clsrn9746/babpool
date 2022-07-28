package com.babpool.main.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.babpool.common.vo.SchedulePagingVO;
import com.babpool.common.vo.SearchVO;
import com.babpool.main.vo.CalendarVO;

@Mapper
public interface ICalendarDao {
	
	// 풀캘린더에서 일정 보여 주기
	public List<CalendarVO> getCalendarList();
	public int getTotalRowCount(SchedulePagingVO paging);
	
	// 내 일정 보여 주기
	public List<CalendarVO> getMyScheduleList();
	
	// 다가오는 일정 보여 주기
	public List<CalendarVO> getScheduleList(SchedulePagingVO paging);
	
	// 캘린더 추가
	public int toCalendarList(CalendarVO calendar);
	
	// 캘린더 삭제
	public int deleteCalendar(CalendarVO calendar);
	
	// 캘린더 수정
	public int updateCalendar(CalendarVO calendar);
	
	// 정보 채팅으로 가져오기
	public CalendarVO getChatCalendar(int calNo);
	
	


}
