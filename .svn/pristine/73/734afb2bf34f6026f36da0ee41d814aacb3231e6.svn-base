package com.babpool.member.web;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.babpool.food.dao.IRecommendDao;
import com.babpool.member.dao.MemberDao;
import com.babpool.member.service.IMailService;
import com.babpool.member.service.MailSendService;
import com.babpool.member.service.MailServiceImpl;
import com.babpool.member.vo.MailAuthVO;
//import com.babpool.member.service.MemberServiceImpl;
import com.babpool.member.vo.MemberVO;
import com.babpool.naverLogin.NaverLoginVO;

@Controller
public class MemberController {
	
	@Autowired
	MemberDao memberDao;
	
	@Autowired
    MailSendService mailSendService;
	
	@Autowired
	IMailService mailService;
	
	@Inject
	IRecommendDao recommendDao;
	
	/*@RequestMapping("/loginPage.do")
	public String loginPage() {
		
		
		return "login/loginPage";
	}*/
	
	@RequestMapping("/join.do")
	public String join() {
		return "login/join";
	}
	
	@RequestMapping("/pwfindPage.do")
	public String pwfind() {
		return "login/pwfindPage";
	}
	
	@RequestMapping(value = "/mypage.do")
	public String myPage() {
		
		return "mypage/mypage";
	}
	
	@RequestMapping(value = "memberlist.do")
	public String memberList(Model model) {
		List<MemberVO> memList = memberDao.getmemberList();
		System.out.println(memList.toString());
		model.addAttribute("memberList", memList);
		
		return "mypage/memberlist";
	}
	
	@RequestMapping(value = "memberview.do", method = RequestMethod.GET)
	public String memberView(Model model, HttpServletRequest req) {
		MemberVO member = memberDao.getMemberbyId(req.getParameter("memid"));
		model.addAttribute("getmember", member);
		return "mypage/memberview";
	}
	
	@RequestMapping(value = "memberban.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String memberBan(String memid) {
		System.out.println("memberBan진입");
		int cnt = memberDao.memberBan(memid);
		if(cnt != 0) {
			return "success";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "memberpermit.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String memberPermit(String memid) {
		System.out.println("memberpermit진입");
		int cnt = memberDao.memberPermit(memid);
		if(cnt != 0) {
			return "success";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	public String loginCheck(HttpSession session, MemberVO vo) throws UnsupportedEncodingException {
		String returnURL = "";
		
		MemberVO memberVO = memberDao.getMember(vo);
		
		if(memberVO.getMemRole().equals("N")) {
			session.setAttribute("memId", memberVO.getMemId());
			
			if(memberVO != null) { // 로그인에 성공했을 시
				System.out.println("로그인 성공!");
				session.setAttribute("member", memberVO);
				session.setAttribute("nickname", memberVO.getMemNickname());
				
				returnURL = "redirect:/main.do";
			}else {	//로그인 실패
				System.out.println("로그인 실패!");
				returnURL = "redirect:" + "/loginPage.do?msg="
	                    + URLEncoder.encode("아이디 또는 비밀번호를 확인해주세요", "utf-8");
			}
		}else {
			returnURL = "redirect:" + "/loginPage.do?msg=" + URLEncoder.encode("정지된 계정입니다.", "utf-8");
		}
		
		return returnURL;
	}
	
	
	@RequestMapping("logOut.do")
		public String logOut(HttpSession session) {
			session.invalidate();
			return "redirect:/main.do";
		}
	
	@RequestMapping(value = "/regist.do", method = RequestMethod.POST)
	public String regist(MemberVO vo) {
		
		memberDao.registMember(vo);
		
		System.out.println("회원가입 완료!");
		
		return "redirect:/loginPage.do";
	}
	
	@RequestMapping(value = "/pwFindSuccess.do", method = RequestMethod.POST)
	public String pwFindSuccess() {
		System.out.println("비밀번호 변경 완료!");
		
		return "redirect:/loginPage.do"; 
	}
	
	@RequestMapping(value = "/mailAuth.do", method = RequestMethod.GET)
	@ResponseBody
	public String mailAuth(String mail, HttpServletResponse resp) throws Exception {
		 MemberVO member = memberDao.mailCheck(mail);
		 if(member == null) {
		    String authKey = mailSendService.sendAuthMail(mail); //사용자가 입력한 메일주소로 메일을 보냄
		    mailService.registMailAuth(mail, authKey);
		    return authKey;
		 }else {
			 return "false";
		 }
	}
	
	@RequestMapping(value = "/authKeyCompare.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String authKeyCompare(String mail) {
		int cnt = mailService.isMailAuthed(mail);
		if(cnt != 0) {
			return "success";
		}else {
			return "실패";
		}
	}
	
	@RequestMapping(value = "/isMailAuthed.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String isMailAuthed(String mail) {
		int isAuth = mailService.isMailAuthed(mail);
		if(isAuth == 1) return "success";
		else return "실패";
	}
	
	@RequestMapping(value = "/idCheck.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String idCheck(String id) {
		MemberVO member = memberDao.idCheck(id);
		if(member == null && id != "") {
			return "사용가능";
		}else if(id == "") {
			return "공백";
		}else {
			return "중복";
		}
	}
	
	@RequestMapping(value = "/mailCheck.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String mailCheck(MailAuthVO mailAuth) {
		int cnt = mailService.authKeyCompare(mailAuth);
		if(cnt != 0) {
			return "인증";
		}else {
			return "실패";
		}
	}
	
	@RequestMapping(value = "/mailConfirm.do",  produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String mailConfirm(String email) {
		MemberVO member = memberDao.mailCheck(email);
		if(member == null && email != "") {
			return "없음";
		}else if(email == "") {
			return "공백";
		}else {
			return "있음";
		}
	}
	
	@RequestMapping(value = "/pwfindSubmit.do", produces = "text/plain;charset=utf-8")
	@ResponseBody
	public String pwfindSubmit(String mail) throws MessagingException {
		String randPw = mailSendService.sendRandPw(mail);
		if(randPw != "fail to send mail") {
			int cnt = memberDao.updateRandPw(mail, randPw);
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value = "upload.do", method = RequestMethod.POST)
	public String upload(@RequestParam("profileimg") MultipartFile file, HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String id = member.getMemId();
		String oldprofile = member.getMemProfile();
		String fileRealName = file.getOriginalFilename();
//		String path = session.getServletContext().getRealPath("/"); //톰캣 경로
		
		String path = "/home/pc94/upload";
		long size = file.getSize();
		
		System.out.println(path);
		
		System.out.println("닉네임 :" + id);
		System.out.println("용량 : " + size);
		
		//확장자명 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
//		String uploadFolder = path + "resources/images/profile";
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		
		String uniqueName = uuids[0] + "_" + id;
		
		String fileFullName = uniqueName + fileExtension;
		
		System.out.println(fileFullName);
		
		File saveFile = new File(path + "/" + fileFullName);
		File deleteFile = new File(path + "/" + oldprofile);
		
		try {
			file.transferTo(saveFile); //파일 저장메소드
			int cnt = memberDao.updateProfile(fileFullName, id);
			MemberVO updateSession = memberDao.updateSession(fileFullName);
			
			if(deleteFile.exists()) {
				deleteFile.delete();
				System.out.println("정상적으로 삭제 되었습니다!");
			}else {
				System.out.println("파일이 존재하지 않습니다!");
			}
			
			//새로 올린 이미지로 select해서 세션 재설정
			session.setAttribute("member", updateSession);
			session.setAttribute("path", path);
		}catch (IllegalStateException e) {
			return "redirect:/error.do";
		} catch (IOException e) {
			return "redirect:/error.do";
		}
		
		return "redirect:/mypage.do";
		
	}
	
	@RequestMapping(value = "/profileDelete.do", method = RequestMethod.POST)
	public String deleteProfile(HttpSession session) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String nickname = member.getMemNickname();
		String profile = member.getMemProfile();
		String id = member.getMemId();
		String path = session.getServletContext().getRealPath("/"); //톰캣 경로
		String uploadFolder = path + "resources/profileimg";
		File deleteFile = new File(uploadFolder + "/" + profile);
		
		if(deleteFile.exists()) {
			deleteFile.delete();
			System.out.println("정상적으로 삭제 되었습니다!");
		}else {
			System.out.println("파일이 존재하지 않습니다!");
		}
		
		memberDao.defaultProfile(id);
		MemberVO updateSession = memberDao.getMember(member);
		session.setAttribute("member", updateSession);
		
		
		
		return "redirect:/mypage.do";
	}
	
	
	
	
}
