package com.babpool.notice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babpool.common.vo.SearchVO;
import com.babpool.notice.dao.INoticeDao;
import com.babpool.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements INoticeService {
	
	@Inject
	INoticeDao noticeDao;
	
	@Override
	public List<NoticeVO> getNoticeList(SearchVO searchVO) {
		int totalRowCount = noticeDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		return noticeDao.getNoticeList(searchVO);
	}
	
	@Override
	public NoticeVO getNotice(int noticeNo) {
		NoticeVO notice = noticeDao.getNotice(noticeNo);
		return notice;
	}

	@Override
	public void insertNotice(NoticeVO notice) {
		noticeDao.insertNotice(notice);
		
	}

	@Override
	public void deleteNotice(NoticeVO notice) {
		noticeDao.deleteNotice(notice);
		
	}

	@Override
	public void updateNotice(NoticeVO notice) {
		noticeDao.updateNotice(notice);
		
	}

	@Override
	public List<NoticeVO> getMainNoticeList() {
		return noticeDao.getMainNoticeList();
	}

	

	

	

	

}
