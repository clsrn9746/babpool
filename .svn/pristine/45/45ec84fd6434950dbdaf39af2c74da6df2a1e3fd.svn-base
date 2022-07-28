package com.babpool.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.babpool.reply.service.ReplyServiceImpl;
import com.babpool.reply.vo.ReplySearchVO;
import com.babpool.reply.vo.ReplyVO;

@Mapper
public interface IReplyDao {
 
	// 댓글 카운트
	public int getReplyCountByParent(ReplySearchVO searchVO);
	// 댓글조회
	public List<ReplyVO> getReplyList(int reBoardNo) throws Exception;
	// 지금하는거
	public List<ReplyVO> getReplyListByParent(ReplySearchVO searchVO) throws Exception;
	
	 
	
	//댓글수정
	public void updateReply(ReplyVO vo) throws Exception;
	
	//  댓글 삭제
	public void deleteReply(ReplyVO vo) throws Exception;
	
	//선택된 댓글 조회
	public ReplyVO selectReply(int reNo) throws Exception;
	
	//댓글등록
	public int insertReply(ReplyVO reply) throws Exception;
	
}
