package com.babpool.one.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.babpool.market.dao.IMarketDao;
import com.babpool.market.vo.MarketVO;

@Controller
public class ControllerOne {

	@Inject
	IMarketDao marketDao;
	
	@RequestMapping(value = "/one.do", method = RequestMethod.GET)
	public String view_chat(HttpServletRequest request, HttpServletResponse response, Model model, int marketNo) throws Exception {
		MarketVO marketChat = marketDao.getChatMarket(marketNo);
		model.addAttribute("marketChat", marketChat);
		
		
		return "one/one";
	}
}