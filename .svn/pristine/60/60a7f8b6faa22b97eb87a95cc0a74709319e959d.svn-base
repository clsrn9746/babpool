package com.babpool.member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.babpool.free.vo.FreeBoardVO;
import com.babpool.market.vo.MarketVO;
import com.babpool.member.vo.BlockMemberVO;
import com.babpool.member.vo.FavoriteMemberVO;
import com.babpool.member.vo.MemberVO;
import com.babpool.member.vo.MyPageVO;

@Mapper
public interface MypageDao {
	    //마이페이지
		public int updateProfile(@Param("fileName")String fileName, @Param("id")String id);
		public MemberVO updateSession(@Param("fileName")String fileName); //세션 갱신을 위한 SELECT
		public void defaultProfile(@Param("id")String id);
		public int memberDrop(String id);
		
		//내가 쓴 글
		public List<MarketVO> getmyMarket(MyPageVO mypage);
		public int getMarketTotal(MyPageVO mypage);
		public List<FreeBoardVO> getmyFreeBoard(MyPageVO mypage);
		public int getFreeBoardTotal (MyPageVO mypage);
		
		//좋아하는 회원
		public List<FavoriteMemberVO> getFavoritemember(@Param("memId")String memId);
		public int insertFavMember(HashMap<String, Object> map);
		public FavoriteMemberVO favOverlap(@Param("myMemId")String myMemId, @Param("favMemId")String favMemId);
		public int deleteFavMember (@Param("favMemId")String favMemId, @Param("myMemId")String myMemId);
		
		//차단 회원
		public List<BlockMemberVO> getBlockmember(@Param("memId")String memId);
		public int deleteBlockMember (@Param("favMemId")String favMemId, @Param("myMemId")String myMemId);
		public BlockMemberVO blockOverlap(@Param("myMemId")String myMemId, @Param("blockMemId")String blockMemId);
		public int insertBlockMember(HashMap<String, Object> map);
		
		//밥풀 점수 관련
		public int avgplusorminus(@Param("otherMemberId")String otherMemberId, @Param("otherMemberAvg")double otherMemberAvg);
		
}
