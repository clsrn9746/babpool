package com.babpool.food.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.babpool.common.vo.SearchVO;
import com.babpool.food.vo.FoodVO;
import com.babpool.food.vo.RecommendVO;
import com.babpool.member.vo.MemberVO;

@Mapper
public interface IRecommendDao {

	//음식 카운트
	public int getTotalRowCount(SearchVO SearchVO);
	
	// 음식 조회
	public List<FoodVO> getRecommendList(SearchVO SearchVO) throws Exception;
	
	
	//선택 음식정보만
	public FoodVO selectFood(int foodNo) throws Exception;

	// 선택된 자료들 삽입 
	public int insertRecommend(RecommendVO recommendVO);
	
	// 선택 
	public int getRecommendUser(RecommendVO recommendVO);

	//선택 음관련 멤버정보
	public int getMember(MemberVO memberVO) ;
	
	//조회
	public RecommendVO findRecommend(String id);
	
	// 오늘의 키워드 검색
	public String getTodayKey(String key);
}
