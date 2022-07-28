package com.babpool.food.web;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.babpool.common.vo.SearchVO;
import com.babpool.food.dao.IRecommendDao;
import com.babpool.food.vo.FoodVO;
import com.babpool.food.vo.RecommendVO;
import com.babpool.member.dao.MemberDao;
import com.babpool.member.vo.MemberVO;

@Controller
public class RecommendController {

	
	@Inject
	IRecommendDao recommendDao;
	
	@Inject
	MemberDao memberDao;
	
	@RequestMapping("/recommend.do")
	public String recommendList(Model model, @ModelAttribute("searchVO") SearchVO searchVO, String key) throws Exception {
		System.out.println(searchVO);
		int totalRowCount = recommendDao.getTotalRowCount(searchVO);
		searchVO.setTotalRowCount(totalRowCount);
		searchVO.pageSetting();
		
		
		String keywoards = recommendDao.getTodayKey(key);
		model.addAttribute("keywoards", keywoards);
		System.out.println("keywoards"+keywoards);
		
		
		List<FoodVO> recommendList = recommendDao.getRecommendList(searchVO);
		model.addAttribute("recommendList", recommendList);
		
		return "recommend/recommend";
		
	}
	
	@ResponseBody
	@RequestMapping(value ="/recommendRegist.do" , method={RequestMethod.POST})
	public Map<String, Object> recommendRegist(@RequestBody Map<String, Object>[] params,
			@ModelAttribute("memberVO") MemberVO memberVO, RecommendVO recommendVO,  HttpSession session,Model model)throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO member = (MemberVO) session.getAttribute("member");
//		RecommendVO recommend = new RecommendVO();
//		recommendVO.setMemberId(member.getMemId());
//		recommendVO.setMemberNicname(member.getMemNickname());
//		recommendVO.setMemberProfile(member.getMemProfile());	
//		int cnt = recommendDao.getRecommendUser(recommendVO);
		if(member != null) {
			recommendVO.setMemberId(member.getMemId());
			int cnt = recommendDao.getRecommendUser(recommendVO);

			if(cnt >= 5) {
				map.put("flag","duple");
				return map;
			}else if(recommendVO == null){
				HttpURLConnection conn = null;
				String responseData = "";	    	   
				BufferedReader br = null;
				StringBuffer sb = null;
				String returnData = null;
				for(int i = 0 ; i < params.length; i ++) {
//					RecommendVO recommendVO = new RecommendVO();
					recommendVO.setMemberId((String) params[i].get("memberId"));
					recommendVO.setMemberNicname(member.getMemNickname());
					recommendVO.setMemberProfile(member.getMemProfile());	
					recommendVO.setFoodNo((int) params[i].get("foodNo"));
					recommendVO.setRecommendScore(String.valueOf( params[i].get("recommendScore")));
					System.out.println(params);
					recommendDao.insertRecommend(recommendVO);
				}
				// 운영 반영시 수정
				URL url = new URL("http://192.168.1.15:5454/sim/"+member.getMemId());
				conn = (HttpURLConnection) url.openConnection();
				
				conn.setRequestProperty("Accept", "application/json");	               
				conn.setRequestMethod("GET");	        
				
				br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));	
				sb = new StringBuffer();	       
				while ((responseData = br.readLine()) != null) {
					sb.append(responseData); //StringBuffer에 응답받은 데이터 순차적으로 저장 실시
				}
//				//메소드 호출 완료 시 반환하는 변수에 버퍼 데이터 삽입 실시
				returnData = sb.toString(); 
				//2. Parser
		       JSONParser jsonParser = new JSONParser();
		        //3. To Object
		       Object obj = jsonParser.parse(returnData);
		       System.out.println(obj);
				 //4. To JsonObject
		       JSONArray jsonObj = (JSONArray) obj;
		       System.out.println(jsonObj.toString());
				map.put("flag","first");
		       map.put("result", jsonObj);
		       

				
				return map;
			}else {
				HttpURLConnection conn = null;
				String responseData = "";	    	   
				BufferedReader br = null;
				StringBuffer sb = null;
				String returnData = null;
				for(int i = 0 ; i < params.length; i ++) {
//					RecommendVO recommendVO = new RecommendVO();
					recommendVO.setMemberId((String) params[i].get("memberId"));
					recommendVO.setMemberNicname(member.getMemNickname());
					recommendVO.setMemberProfile(member.getMemProfile());	
					recommendVO.setFoodNo((int) params[i].get("foodNo"));
					recommendVO.setRecommendScore(String.valueOf( params[i].get("recommendScore")));
					System.out.println(params);
					recommendDao.insertRecommend(recommendVO);
				}
				// 운영 반영시 수정
				URL url = new URL("http://192.168.1.15:5454/sim/"+member.getMemId());
				conn = (HttpURLConnection) url.openConnection();
				
				conn.setRequestProperty("Accept", "application/json");	               
				conn.setRequestMethod("GET");	        
				
				br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));	
				sb = new StringBuffer();	       
				while ((responseData = br.readLine()) != null) {
					sb.append(responseData); //StringBuffer에 응답받은 데이터 순차적으로 저장 실시
				}
//				//메소드 호출 완료 시 반환하는 변수에 버퍼 데이터 삽입 실시
				returnData = sb.toString(); 
				//2. Parser
		       JSONParser jsonParser = new JSONParser();
		        //3. To Object
		       Object obj = jsonParser.parse(returnData);
		       System.out.println(obj);
				 //4. To JsonObject
		       JSONArray jsonObj = (JSONArray) obj;
		       System.out.println(jsonObj.toString());
		       map.put("flag","success");
		       map.put("result", jsonObj);
		       

				
			   return map;
			 }
		} else {
			map.put("flag","false");
			return map;
		}
		
	
	}
	
	@RequestMapping("/recommendFriend.do")
	public String recommendFriend(Model model, @ModelAttribute("memberVO") MemberVO memberVO, HttpSession session) throws Exception {
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		System.out.println(memberVO);
		return "recommend/recommendFriend";
		
	}
}
