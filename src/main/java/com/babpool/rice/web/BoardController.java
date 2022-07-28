package com.babpool.rice.web;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.babpool.rice.service.BoardService;
import com.babpool.rice.vo.BoardVO;


@Controller
public class BoardController {
	
	@Inject
	BoardService service;
	
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Locale locale, Model model) {
		List<BoardVO> boardList = service.getBoardList();
		
		
		model.addAttribute("boardList", boardList );
		
		return "board";
	

	}

}
