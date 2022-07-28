package com.babpool.rice.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babpool.rice.dao.IBoardDao;
import com.babpool.rice.vo.BoardVO;

@Service
public class BoardService {
	
	@Inject
	IBoardDao boardDao;
	public List<BoardVO> getBoardList(){
		return boardDao.getBoardList();
	}
	
	public String namgyu() {
		return "뭘봐";
	}
	public String namgyu2() {
		return "뭘봐2";
	}
	public String namgyu3() {
		return "뭘봐3";
	}
}
