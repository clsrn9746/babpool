package com.babpool.faq.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.babpool.common.vo.SearchVO;
import com.babpool.faq.service.IFaqService;
import com.babpool.faq.vo.FaqVO;

@Controller
public class FaqController {
	
	@Inject
	IFaqService faqService;
	
	@RequestMapping(value = "/faq.do")
	public String getFaqList(Model model) {
		List<FaqVO> faqList = faqService.getFaqList();
		model.addAttribute("faqList", faqList);
		return "faq/faqList";
	}
}
