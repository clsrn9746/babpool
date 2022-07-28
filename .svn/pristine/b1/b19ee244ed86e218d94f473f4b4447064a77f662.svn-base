package com.babpool.free.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.babpool.common.vo.SearchVO;
import com.babpool.free.vo.FreeBoardVO;

@Mapper
public interface IFreeBoardDao {
	public int getTotalRowCount(SearchVO searchVO);
	public List<FreeBoardVO> getBoardList(SearchVO searchVO);
	
	public List<FreeBoardVO> getMainFreeBoardList();
	
	public FreeBoardVO getFreeBoard(int boNo);
	
	public int updateBoard(FreeBoardVO freeBoard);
	public int deleteBoard(FreeBoardVO freeBoard);
	public int insertBoard(FreeBoardVO freeBoard);
	
}
