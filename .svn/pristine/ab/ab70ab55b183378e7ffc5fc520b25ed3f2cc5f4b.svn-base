package com.babpool.naverLogin;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.babpool.member.dao.MemberDao;
import com.babpool.member.vo.MemberVO;
import com.github.scribejava.core.model.OAuth2AccessToken;

@Controller
public class NaverLoginController {
	private NaverLoginVO naverLoginVO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginVO(NaverLoginVO naverLoginVO) {
		this.naverLoginVO = naverLoginVO;
	}
	@Autowired
	INaverLoginDao naverLoginDao;
	
	//로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/loginPage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String naverLogin(Model model, HttpSession session) {
		//네이버아이디로 인증 URL을 생성하기 위해 naverLoginVO클래스의 getAuthorizationUrI메소드 호출
		String naverAuthURI = naverLoginVO.getAuthorizationUrl(session);
		
		System.out.println("네이버:" + naverAuthURI);
		//네이버
		model.addAttribute("naverLoginurl", naverAuthURI);
		
		return "login/loginPage";
	}
	
	@RequestMapping(value = "/naverCallBack.do", method = {RequestMethod.GET, RequestMethod.POST} )
	public String naverCallBack(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {
		System.out.println("naverCallBack 진입");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginVO.getAccessToken(session, code, state);
		//1. 로그인 사용자 정보를 얻어온다
		apiResult = naverLoginVO.getUserProfile(oauthToken); //String형식의 JSON 데이터
		
		//2. String 형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		System.out.println(jsonObj);
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		String email = (String)response_obj.get("email");
		String name = (String)response_obj.get("name");
		String gender = (String)response_obj.get("gender");
		String mobile = (String)response_obj.get("mobile");
		String id = (String)response_obj.get("id");
		
		MemberVO naverMember = naverLoginDao.findNaverMember(email);
		
		int idx = email.indexOf("@");
		
		String realid = email.substring(0, idx);
		
//		model.addAttribute("result", apiResult);
		
		//select 해서 이메일 + 타입이 네이버인지 조회해서 널이면 naverjoin.do로가고 아니면 free/freeList로 가
		if(naverMember == null) {
			session.setAttribute("email", email);
			session.setAttribute("name", name);
			session.setAttribute("gender", gender);
			session.setAttribute("realid", realid);
			session.setAttribute("mobile", mobile);
			session.setAttribute("id", id);
			return "login/naverjoin";
		}else {
			session.setAttribute("member", naverMember);
			return "redirect:/main.do";
		}
	}
	
	@RequestMapping(value = "/naverregist.do", method = RequestMethod.POST)
	public String regist(HttpSession session, MemberVO vo) {
		int cnt = naverLoginDao.registNaver(vo);
		
		if(cnt != 0) {
			System.out.println("네이버 간편 가입 완료!");
			MemberVO naverMember = naverLoginDao.findNaverMember(vo.getMemEmail());
			session.setAttribute("member", naverMember);
			return "redirect:/main.do";
		}else {
			System.out.println("간편가입 실패");
		}
		return "redirect:/loginPage.do";
	}
	
	
	
	
	
	
	
	
	
}
