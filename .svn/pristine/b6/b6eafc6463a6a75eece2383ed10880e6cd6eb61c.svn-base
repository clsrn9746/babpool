package com.babpool.market.web;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.groups.Default;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.babpool.attach.dao.IAttachDao;
import com.babpool.attach.vo.AttachVO;
import com.babpool.common.util.StudyAttachUtils;
import com.babpool.common.valid.Modify;
import com.babpool.common.vo.PagingVO;
import com.babpool.common.vo.SearchVO;
import com.babpool.exception.BizNotEffectedException;
import com.babpool.exception.BizNotFoundException;
import com.babpool.market.dao.IMarketDao;
import com.babpool.market.vo.MarketVO;
import com.babpool.member.dao.MemberDao;
import com.babpool.member.service.IMypageService;
import com.babpool.member.vo.BlockMemberVO;
import com.babpool.member.vo.MemberVO;

@Controller
public class MarketController {

	@Inject
	IMarketDao marketDao;

	@Inject
	IAttachDao attachDao;
	
	@Autowired
	IMypageService mypageService;
	
	@Autowired
	MemberDao memberDao;

	@Value("#{util['file.upload.path']}")
	private String uploadPath;

	@RequestMapping(value = "/marketList.do")
	public String marketList(HttpServletRequest request, Model model, @ModelAttribute("search") SearchVO search, HttpSession session)
			throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member != null) {
			List<BlockMemberVO> blockMemberList = mypageService.getmyBlockMemList(member); 
			model.addAttribute("blockMemberList", blockMemberList);
		}
		
		// getTotalRowCount에서 전체 글 수를 구함
		int totalRowCount = marketDao.getTotalRowCount(search);
		search.setTotalRowCount(totalRowCount);
		search.pageSetting();

		List<MarketVO> marketList = marketDao.getMarketList(search);
		model.addAttribute("marketList", marketList);

		return "market/marketList";
	}

	@GetMapping("/marketImage.do")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {

		File file = new File(uploadPath + "/market/" + fileName);

		ResponseEntity<byte[]> result = null;
		try {
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), headers, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	@RequestMapping(value = "/marketView.do")
	public String marketView(Model model, int marketNo) throws Exception {
		MarketVO market = marketDao.getMarket(marketNo);

		if (market == null) {
			throw new BizNotFoundException();
		}

		List<AttachVO> attaches = attachDao.getAttachListByParent(marketNo, "MARKET");
		market.setAttaches(attaches);
		marketDao.updateHit(market);

		model.addAttribute("market", market);
		return "market/marketView";
	}
	@ResponseBody
	@RequestMapping(value = "/marketLike.do")
	public Map<String, Object> marketLike(Model model, int marketNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		MarketVO market = marketDao.getMarket(marketNo);
		marketDao.updateLike(market);
		
		map.put("flag","성공");
		map.put("market", market);
		return map;
	}

	@Inject
	StudyAttachUtils studyAttachUtils;

	@PostMapping("/marketRegist.do")
	public String marketRegist(HttpServletRequest request, Model model,
			@ModelAttribute("market") @Validated(Default.class) MarketVO market, BindingResult error,
			@RequestParam(value = "boFiles", required = false) MultipartFile[] boFiles) throws IOException {

		if (error.hasErrors()) {
			return "market/marketRegist";
		}

		try {

			if (boFiles != null) {
				List<AttachVO> attaches = studyAttachUtils.getAttachListByMultiparts(boFiles, "MARKET", "market");
				// 실제로 파일경로에 선택된 파일 올리고 List<AttachVO> return (파일업로드)
				market.setAttaches(attaches);
			}

			int cnt = marketDao.insertMarket(market);

			if (cnt == 0)
				throw new BizNotEffectedException();

			List<AttachVO> attaches = market.getAttaches();
			if (attaches != null) {
				for (AttachVO attach : attaches) {
					attach.setAtchParentNo(market.getMarketNo());
					attachDao.insertAttach(attach);
				}

				System.out.println("글 등록 성공");
				System.out.println(market);
				System.out.println(attaches);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("글 등록 실패");
		}
		return "market/marketRegist";
	}

	// 글 수정
	@RequestMapping(value = "/marketEdit.do")
	public String marketEdit(Model model, int marketNo) throws BizNotFoundException {
		MarketVO market = marketDao.getMarket(marketNo);

		if (market == null) {
			throw new BizNotFoundException();
		}

		List<AttachVO> attaches = attachDao.getAttachListByParent(marketNo, "MARKET");
		market.setAttaches(attaches);
		
		model.addAttribute("market", market);
		return "market/marketEdit";
	}

	// 글 수정 완료 alert -> 리스트 넘어가게
	@RequestMapping(value = "/marketModify.do")
	public String marketModify(Model model, @ModelAttribute("market") @Validated(Modify.class) MarketVO market,
			BindingResult error, @RequestParam(value = "boFiles", required = false) MultipartFile[] boFiles)
			throws IOException {

		try {
			if (boFiles != null) {
				List<AttachVO> attaches = studyAttachUtils.getAttachListByMultiparts(boFiles, "MARKET", "market");
				market.setAttaches(attaches);

				// 추가한 첨부파일 insert
				attaches = market.getAttaches();
				if (attaches != null) {
					for (AttachVO attach : attaches) {
						attach.setAtchParentNo(market.getMarketNo());
						attachDao.insertAttach(attach);
						System.out.println("파일이 추가되었습니다.");
					}

				} else {
					System.out.println("파일이 추가되지 않았습니다.");
					return "market/marketEdit";
				}

				// 첨부파일 삭제
				int delAtchNos[] = market.getDelAtchNos();

				// 첨부파일을 삭제했을 때
				if (delAtchNos != null && delAtchNos.length > 0) {
					attachDao.deleteAttaches(delAtchNos);
				}

			}
			marketDao.updateMarket(market);
			System.out.println("수정 성공");

		} catch (Exception e) {
			System.out.println("수정 실패");
			System.out.println(e);
		}
		return "market/marketModify";
	}

	// 글 삭제 완료 alert -> 리스트 넘어가게
	@RequestMapping(value = "/marketDelete.do")
	public String marketDelete(Model model, @ModelAttribute("market") MarketVO market) {
		marketDao.deleteMarket(market);
		return "market/marketDelete";
	}

	// 글 등록할 폼
	@RequestMapping(value = "/marketForm.do")
	public String marketForm(Model model, @ModelAttribute("market") MarketVO market) {
		return "market/marketForm";
	}
	
	@RequestMapping(value = "/marketMemberView.do", method = RequestMethod.GET)
	public String marketMemberView(Model model, HttpServletRequest req) {
		MemberVO member = memberDao.nickCheck(req.getParameter("nick"));
		model.addAttribute("getmember", member);
		if(member != null) {
			String secretId = mypageService.secretId(member.getMemId());
			model.addAttribute("secretId", secretId);
		}
		return "market/marketMemberView";
	}


}
