package com.babpool.reply.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babpool.reply.dao.IReplyDao;
import com.babpool.reply.vo.ReplySearchVO;
import com.babpool.reply.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements IReplyService{
	
	@Inject
	private IReplyDao dao;

	// 댓글조회
	@Override
	public List<ReplyVO> getReplyList(int reBoardNo) throws Exception {
		return dao.getReplyList(reBoardNo);
	}
	
	@Override
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO) throws Exception {
		int totalRowCount=dao.getReplyCountByParent(searchVO);
		System.out.println(totalRowCount);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		List<ReplyVO> replyList =dao.getReplyListByParent(searchVO);
		System.out.println(replyList);
		return replyList;
	}
	
	//댓글작성
	@Override
	public void registReply(ReplyVO reply) throws Exception {
			dao.insertReply(reply);
	}
		

	//댓글수정
	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		dao.updateReply(vo);
		
	}
	
	//댓글삭제
	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		dao.deleteReply(vo);
	}

	//선택된댓글 조회
	@Override
	public ReplyVO selectReply(int reNo) throws Exception {
		return dao.selectReply(reNo);
	}


	
	

	
	
	

}