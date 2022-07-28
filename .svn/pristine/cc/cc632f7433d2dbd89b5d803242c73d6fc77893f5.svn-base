package com.babpool.faq.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.babpool.common.vo.SearchVO;
import com.babpool.faq.dao.IFaqDao;
import com.babpool.faq.vo.FaqVO;

@Service
public class FaqServiceImpl implements IFaqService{
	
	@Inject
	IFaqDao faqDao;
	
	@Override
	public List<FaqVO> getFaqList() {
		
		return faqDao.getFaqList();
	}

}
