package com.babpool.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.babpool.common.vo.SearchVO;
import com.babpool.notice.vo.NoticeVO;

@Mapper
public interface INoticeDao {
	public int getTotalRowCount(SearchVO searchVO);
	// 공지사항 리스트 
	public List<NoticeVO> getNoticeList(SearchVO searchVO);
	// 하나의 공지사항 불러오기
	public NoticeVO getNotice(int NoticeNo);
	// 공지사항 등록
	public int insertNotice(NoticeVO notice);
	// 공지사항 삭제
	public int deleteNotice(NoticeVO notice);
	// 공지사항 수정
	public int updateNotice(NoticeVO notice);
	// 메인에서 최근 글 2개 받아오기
	public List<NoticeVO> getMainNoticeList();
}
