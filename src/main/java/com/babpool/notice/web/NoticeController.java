package com.babpool.notice.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.babpool.common.vo.SearchVO;
import com.babpool.notice.service.INoticeService;
import com.babpool.notice.vo.NoticeVO;

@Controller
public class NoticeController {
	
	@Inject
	INoticeService noticeService;
	// 리스트
	@RequestMapping(value = "/noticeList.do")
	public String NoticeList(Model model, @ModelAttribute("searchVO")SearchVO searchVO) throws Exception{
		List<NoticeVO> noticeList = noticeService.getNoticeList(searchVO);
		model.addAttribute("noticeList", noticeList);
		return "notice/noticeList";
	}
	
	// 뷰
	@RequestMapping(value = "/noticeView.do")
	public String noticeView(Model model, int noticeNo) {
		NoticeVO notice = noticeService.getNotice(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/noticeView";
	}
	
	// 수정 폼 
	@RequestMapping(value="/noticeEdit.do")
	public String noticeEdit(Model model, int noticeNo) {
		NoticeVO notice = noticeService.getNotice(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/noticeEdit";
	}
	// 수정
	@RequestMapping(value = "/noticeModify.do")
	public String noticeModify(Model model, @ModelAttribute("notice")NoticeVO notice) {
		noticeService.updateNotice(notice);
		System.out.println(notice);
		return "notice/noticeModify";
	}
	// 삭제
	@RequestMapping(value = "/noticeDelete.do")
	public String noticeDelete(Model model, @ModelAttribute("notice")NoticeVO notice) {
		noticeService.deleteNotice(notice);
		return "notice/noticeDelete";
	}
	
	// 등록 폼
	@RequestMapping(value = "/noticeForm.do")
	public String noticeForm() {
		
		return "notice/noticeForm";
	}
	// 등록
	@RequestMapping(value = "/noticeRegist.do")
	public String noticeRegist(Model model, @ModelAttribute("notice")NoticeVO notice) {
		noticeService.insertNotice(notice);
		return "notice/noticeRegist";
	}
	
}
