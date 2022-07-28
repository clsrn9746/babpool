package com.babpool.notice.service;

import java.util.List;

import com.babpool.common.vo.SearchVO;
import com.babpool.notice.vo.NoticeVO;

public interface INoticeService {
	public List<NoticeVO> getNoticeList(SearchVO searchVO);
	public NoticeVO getNotice(int noticeNo);
	public void insertNotice(NoticeVO notice); 
	public void deleteNotice(NoticeVO notice); 
	public void updateNotice(NoticeVO notice); 
	public List<NoticeVO> getMainNoticeList();
}
