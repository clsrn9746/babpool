package com.babpool.rice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.babpool.rice.vo.BoardVO;

@Mapper
public interface IBoardDao {
	public List<BoardVO> getBoardList();
	
}
