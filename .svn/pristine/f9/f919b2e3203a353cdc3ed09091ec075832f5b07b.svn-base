package com.babpool.free.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.ws.RespectBinding;

import org.springframework.beans.factory.annotation.Autowired;
/*import org.slf4j.Logger;
*/import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.babpool.attach.dao.IAttachDao;
import com.babpool.attach.service.AttachServiceImpl;
import com.babpool.attach.service.IAttachService;
import com.babpool.attach.vo.AttachVO;
import com.babpool.common.util.StudyAttachUtils;
import com.babpool.common.valid.Modify;
import com.babpool.common.vo.PagingVO;
import com.babpool.common.vo.SearchVO;
import com.babpool.exception.BizAccessFailException;
import com.babpool.exception.BizNotEffectedException;
import com.babpool.exception.BizNotFoundException;
import com.babpool.free.dao.IFreeBoardDao;
import com.babpool.free.service.FreeBoardSeriveImpl;
import com.babpool.free.service.IFreeBoardService;
import com.babpool.free.vo.FreeBoardVO;
import com.babpool.member.dao.MemberDao;
import com.babpool.member.service.IMypageService;
import com.babpool.member.vo.BlockMemberVO;
import com.babpool.member.vo.MemberVO;
import com.babpool.notice.service.INoticeService;
import com.babpool.notice.vo.NoticeVO;
import com.babpool.reply.dao.IReplyDao;
import com.babpool.reply.service.IReplyService;
import com.babpool.reply.vo.ReplySearchVO;
import com.babpool.reply.vo.ReplyVO;
import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;

/*import com.sun.org.slf4j.internal.LoggerFactory;
*/
@Controller
public class FreeBoardController {

	@Inject
	IFreeBoardDao freeBoardDao;

	@Inject
	IReplyService replyService;

	@Inject
	IReplyDao replyDao;

	@Inject
	IAttachDao attachDao;

	@Inject
	IAttachService attachService;

	@Inject
	IFreeBoardService freeBoardService;

	@Inject
	INoticeService noticeService;
	
	@Autowired
	IMypageService mypageService;
	
	@Autowired
	MemberDao memberDao;

	/*
	 * private static final com.sun.org.slf4j.internal.Logger LOGGER =
	 * LoggerFactory.getLogger(FreeBoardController.class);
	 */
	@RequestMapping("/freeBoardList.do")
	public String freeList(Model model, @ModelAttribute("searchVO") SearchVO searchVO, ReplySearchVO replysearchVO, HttpSession session)
			throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member != null) {
			List<BlockMemberVO> blockMemberList = mypageService.getmyBlockMemList(member); 
			model.addAttribute("blockMemberList", blockMemberList);
		}
		
		int totalRowCount = freeBoardDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();

		List<NoticeVO> freeNoticeList = noticeService.getMainNoticeList();
		model.addAttribute("freeNoticeList", freeNoticeList);

		List<FreeBoardVO> freeBoardList = freeBoardDao.getBoardList(searchVO);
		model.addAttribute("freeBoardList", freeBoardList);

		List<ReplyVO> replyList = replyService.getReplyListByParent(replysearchVO);
		model.addAttribute("replyList", replyList);

		// 현재 시간 EL문 쓰기 위해
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd hh:mm");
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1); // 1일간 보이도록 하기위해서.
		String nowday = format.format(cal.getTime());
		System.out.println(nowday);
		model.addAttribute("nowday", nowday);

		return "free/freeBoardList";

	}

	@RequestMapping(value = "/freeView.do", method = RequestMethod.GET)
	public String freeView(Model model, int freeBoardNo, ReplySearchVO searchVO) throws Exception {
		FreeBoardVO freeBoard = freeBoardDao.getFreeBoard(freeBoardNo);
		if (freeBoard == null) {
			throw new BizNotFoundException();
		}
		String freeBoardId = freeBoard.getFreeBoardWriter();
		MemberVO member = memberDao.getMemberbyId(freeBoardId);
		String memberImg = member.getMemProfile();
		model.addAttribute("profile", memberImg);

		List<AttachVO> attaches = attachDao.getAttachListByParent(freeBoardNo, "FREE");
		freeBoard.setAttaches(attaches);

		model.addAttribute("freeBoard", freeBoard);
		searchVO.setReBoardNo(freeBoardNo);
		List<ReplyVO> replyList = replyService.getReplyListByParent(searchVO);

		model.addAttribute("replyList", replyList);

		return "free/freeView";

	}

	@RequestMapping("/freeEdit.do")
	public String freeEdit(Model model, int freeBoardNo) {
		FreeBoardVO freeBoard = freeBoardDao.getFreeBoard(freeBoardNo);
		model.addAttribute("freeBoard", freeBoard);
		return "free/freeEdit";
	}

	@Inject
	StudyAttachUtils studyAttachUils;

	@RequestMapping("/freeModify.do")
	public String freeModify(Model model,
			@ModelAttribute("freeBoard") @Validated(value = { Modify.class }) FreeBoardVO freeBoard,
			BindingResult error, @RequestParam(value = "boFiles", required = false) MultipartFile[] boFiles)
			throws IOException, BizNotFoundException {
		if (error.hasErrors()) {
			System.out.println("파일 수정에서 에러남");
		}

		try {

			System.out.println("바로켓 ::" + freeBoard.getAttaches());
			String freeBoardContent = freeBoard.getFreeBoardContent();
			System.out.println("freeBoardContent" + freeBoardContent);

			if (boFiles != null) {
				List<AttachVO> attaches = studyAttachUils.getAttachListByMultiparts(boFiles, "FREE", "free");
				// 실제로 파일경로에 선택된 파일 올리고 List<AttachVO> return (파일업로드)
				freeBoard.setAttaches(attaches);

			}

			freeBoardService.modifyBoard(freeBoard);
			System.out.println("수정성공");

		} catch (Exception e) {
			System.out.println("e" + e);
			System.out.println("수정 실패");

		}

		return "free/freeModify";
	}

	@RequestMapping("/freeDelete.do")
	public String freeDelete(Model model, @ModelAttribute("freeBoard") FreeBoardVO freeBoard) {
		freeBoardDao.deleteBoard(freeBoard);
		return "free/freeDelete";
	}

	@RequestMapping("/freeForm.do")
	public String freeeForm(Model model, @ModelAttribute("freeBoard") FreeBoardVO freeBoard) {
		return "free/freeForm";
	}

	@PostMapping("/freeRegist.do")
	public String freeRegist(Model model, @ModelAttribute("freeBoard") @Validated(Default.class) FreeBoardVO freeBoard,
			BindingResult error, @RequestParam(value = "boFiles", required = false) MultipartFile[] boFiles,
			HttpSession session) throws IOException, BizNotEffectedException {
		System.out.println("freeBoard" + freeBoard);
		MemberVO memberId = (MemberVO) session.getAttribute("member");

		if (error.hasErrors()) {
			System.out.println("파일등록 안돼");
		}
		if (memberId != null) {
			try {
				if (boFiles != null) {
					List<AttachVO> attaches = studyAttachUils.getAttachListByMultiparts(boFiles, "FREE", "free");
					// 실제로 파일경로에 선택된 파일 올리고 List<AttachVO> return (파일업로드)
					freeBoard.setAttaches(attaches);
				}
				System.out.println(freeBoard);
				int cnt = freeBoardDao.insertBoard(freeBoard);

				if (cnt == 0)
					throw new BizNotEffectedException();

				List<AttachVO> attaches = freeBoard.getAttaches();
				System.out.println("attaches" + attaches);
				if (attaches != null) {
					for (AttachVO attach : attaches) {
						attach.setAtchParentNo(freeBoard.getFreeBoardNo());
						attachDao.insertAttach(attach);
					}
				}
				System.out.println("글 등록 성공");
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("글 등록 실패");
			}

			return "free/freeRegist";
		} else {
			System.out.println("글 등록 실패");
			return "login/loginPage";
		}

	}

	// 댓글 수정 GET
	@RequestMapping(value = "/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, ReplySearchVO searchVO, Model model) throws Exception {
		/*
		 * ((Logger) LOGGER).info("reply Write");
		 */
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getReNo()));
		model.addAttribute("searchVO", searchVO);

		return "free/replyUpdateView";
	}

	// 댓글 수정 POST
	@RequestMapping(value = "/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, ReplySearchVO searchVO, RedirectAttributes rttr, HttpSession session)
			throws Exception {
		/*
		 * ((Logger) LOGGER).info("reply Write");
		 */
		MemberVO member = (MemberVO) session.getAttribute("member");

		if (member.getMemId().equals(vo.getReWriterId())) {
			replyService.updateReply(vo);

			rttr.addAttribute("bno", vo.getReBoardNo());
			rttr.addAttribute("CurPage", searchVO.getCurPage());
			rttr.addAttribute("PageSize", searchVO.getPageSize());
			rttr.addAttribute("FirstPage", searchVO.getFirstPage());

		} else {
			System.out.println("로그인이 필요 합니다.");
		}
		return "redirect:/free/freeView";
	}

	@ResponseBody
	@RequestMapping(value = "/replyList.do", produces = "application/json; charset=utf-8")
	public List<ReplyVO> replyList(ReplySearchVO searchVO) throws Exception {
		List<ReplyVO> replyList = replyService.getReplyListByParent(searchVO);
		System.out.println("replyList" + replyList);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", true);
		map.put("data", replyList);
		map.put("size", replyList.size());

		return replyList;
	}

	@ResponseBody
	@RequestMapping(value = "/replyRegist.do", produces = "application/json; charset=utf-8")
	public String replyRegist(ReplyVO reply, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		System.out.println("member::::::" + member);
		System.out.println("댓글등록 ::" + reply);

		if (member != null) {
			System.out.println("member::" + member);

			if (reply.getReSecret() == null) {
				reply.setReSecret("N");
			} else if (reply.getReSecret() != null) {
				reply.setReSecret("Y");
			}

			replyService.registReply(reply);
			System.out.println("등록 : " + reply);
//		map.put("result", true);
//		map.put("msg", "등록성공했어요");

			return "success";
		} else {
			System.out.println("member::" + member);
			return "false";
		}
//		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/replyModify.do", produces = "application/json; charset=utf-8")
	public String replyModify(ReplyVO reply, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		System.out.println("수정member :: " + member);
		System.out.println("reply :: " + reply);
		if (member != null) {
			if (member.getMemId().equals(reply.getReWriterId())) {
				try {
					replyService.updateReply(reply);
					System.out.println("수정가능");
					return "success";

				} catch (Exception e) {
					System.out.println(e);
					System.out.println("에러났네?");
					return "fail";
				}
			}
		}
		return "fail";
	}

	@ResponseBody
	@RequestMapping(value = "/replyDelete.do", produces = "application/json; charset=utf-8")
	public String replyDelete(@ModelAttribute("reply") ReplyVO reply, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		System.out.println("멤버:::"+member.getMemId());
		System.out.println("댓글작성자 ::::"+reply.getReWriterId());
		if (member != null) {
			if (member.getMemId().equals(reply.getReWriterId())) {
				replyDao.deleteReply(reply);

				return "success";

			} else {
				System.out.println("아이디 다름 댓글삭제 실패");
				return "fail";

			}
		} else {
			System.out.println("댓글삭제 실패");
			return "fail";
		}

	}

}
