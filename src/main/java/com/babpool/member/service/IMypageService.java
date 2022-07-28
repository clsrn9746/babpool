package com.babpool.member.service;

import java.util.List;

import com.babpool.free.vo.FreeBoardVO;
import com.babpool.market.vo.MarketVO;
import com.babpool.member.vo.BlockMemberVO;
import com.babpool.member.vo.FavoriteMemberVO;
import com.babpool.member.vo.MemberVO;
import com.babpool.member.vo.MyPageVO;

public interface IMypageService {
	
	public List<MarketVO> getmyMarketList(MyPageVO mypage, MemberVO member);
	public List<FreeBoardVO> getmyFreeBoardList(MyPageVO mypage, MemberVO member);

	//관심, 차단회원 관련
	public List<FavoriteMemberVO> getmyFavMemList(MemberVO member);
	public List<BlockMemberVO> getmyBlockMemList(MemberVO member);
	public int favmemcount(MemberVO member);
	public String favmemService(MemberVO favMember, MemberVO myMember);
	public String favmemRemove(MemberVO favMember, MemberVO myMember);
	public int blockmemcount(MemberVO member);
	public String blockmemService(MemberVO blockMember, MemberVO myMember);
	public String blockmemRemove(MemberVO blockMember, MemberVO myMember);
	public String secretId(String memId);
	
	public int avgplus(MemberVO otherMember);
	public int avgminus(MemberVO otherMember);
	
}
