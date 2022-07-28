package com.babpool.reply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.babpool.reply.vo.ReplySearchVO;
import com.babpool.reply.vo.ReplyVO;

public interface IReplyService {
	// 댓글조회
	public List<ReplyVO> getReplyList(int reBoardNo) throws Exception;
	
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO) throws Exception;
	

	//댓글수정
	public void updateReply(ReplyVO vo) throws Exception;
	
	//  댓글 삭제
	public void deleteReply(ReplyVO vo) throws Exception;
	
	//선택된 댓글 조회
	public ReplyVO selectReply(int reNo) throws Exception;
	
	// 댓글등록
	public void registReply(ReplyVO reply) throws Exception;

}
