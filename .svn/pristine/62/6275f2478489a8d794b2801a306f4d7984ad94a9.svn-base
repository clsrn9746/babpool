package com.babpool.member.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.babpool.free.vo.FreeBoardVO;
import com.babpool.market.vo.MarketVO;
import com.babpool.member.dao.MemberDao;
import com.babpool.member.dao.MypageDao;
import com.babpool.member.vo.BlockMemberVO;
import com.babpool.member.vo.FavoriteMemberVO;
import com.babpool.member.vo.MemberVO;
import com.babpool.member.vo.MyPageVO;

@Service
public class MypageServiceImpl implements IMypageService{
	
	@Autowired
	MypageDao mypageDao;

	@Override
	public List<MarketVO> getmyMarketList(MyPageVO mypage, MemberVO member) {
		mypage.setMemNickname(member.getMemNickname());
		int marketTotal = mypageDao.getMarketTotal(mypage);
		mypage.setTotalRowCount(marketTotal);
		mypage.setRowSizePerPage(5);
		mypage.pageSetting();
		List<MarketVO> marketList = mypageDao.getmyMarket(mypage);
		return marketList;
	}

	@Override
	public List<FreeBoardVO> getmyFreeBoardList(MyPageVO mypage, MemberVO member) {
		mypage.setMemNickname(member.getMemNickname());
		int myFreeBoardTotal = mypageDao.getFreeBoardTotal(mypage);
		mypage.setTotalRowCount(myFreeBoardTotal);
		mypage.setRowSizePerPage(5);
		mypage.pageSetting();
		List<FreeBoardVO> myFreeBoardList = mypageDao.getmyFreeBoard(mypage);
		return myFreeBoardList;
	}

	@Override
	public List<FavoriteMemberVO> getmyFavMemList(MemberVO member) {
		String memId = member.getMemId();
		List<FavoriteMemberVO> favmemList = mypageDao.getFavoritemember(memId);
		return favmemList;
	}

	@Override
	public int favmemcount(MemberVO member) {
		List<FavoriteMemberVO> fevmember = mypageDao.getFavoritemember(member.getMemId());
		int fevcount = fevmember.size();
		System.out.println(fevcount);
		
		
		return fevcount;
	}

	@Override
	public int blockmemcount(MemberVO member) {
		List<BlockMemberVO> blockmember = mypageDao.getBlockmember(member.getMemId());
		int blockCount = blockmember.size();
		System.out.println(blockCount);
		
		
		return blockCount;
	}
	
	@Override
	public String favmemService(MemberVO favMember, MemberVO myMember) {
		
		String favMemId = favMember.getMemId();
		String favMemNick = favMember.getMemNickname();
		String myMemId = myMember.getMemId();
		int favcount = favmemcount(myMember);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("favMemId", favMemId);
		map.put("favMemNick", favMemNick);
		map.put("myMemId", myMemId);
		
		FavoriteMemberVO favCheck = mypageDao.favOverlap(myMemId, favMemId);
		System.out.println(favMemId + myMemId);
		
		if(favcount >= 5) {
			return "toomany";
		}else if(favCheck != null) {
			return "overlap";
		}else if(favMemId.equals(myMemId)) {
			return "itsme";
		}else{
			int cnt = mypageDao.insertFavMember(map);
			int avgcnt = avgplus(favMember);
			if(cnt != 0 && avgcnt != 0) {
				return "success";
			}else {
				return "error";
			}
		}
	}//favmemService

	@Override
	public String favmemRemove(MemberVO favMember, MemberVO myMember) {
		String favMemId = favMember.getMemId();
		String myMemId = myMember.getMemId();
		
		int cnt = mypageDao.deleteFavMember(favMemId, myMemId);
		int avgcnt = avgminus(favMember);
		
		if(cnt != 0 && avgcnt != 0) {
			return "success";
		}else {
			return "error";
		}
	}// favremove
	
	@Override
	public int avgplus(MemberVO otherMember) {
		double otherMemberAvg = otherMember.getMemLevel();
		otherMemberAvg += 0.1;
		String errorCheck = String.valueOf(otherMemberAvg);
		if(errorCheck.length() > 4) {
			String solutionStr = String.format("%.1f", otherMemberAvg);
			double solutionDouble = Double.parseDouble(solutionStr);
			otherMemberAvg = solutionDouble;
		}
		
		int cnt = mypageDao.avgplusorminus(otherMember.getMemId(), otherMemberAvg);
		
		return cnt;
		
	}//avgplus
	
	@Override
	public int avgminus(MemberVO otherMember) {
		double otherMemberAvg = otherMember.getMemLevel();
		otherMemberAvg -= 0.1;
		String errorCheck = String.valueOf(otherMemberAvg);
		if(errorCheck.length() > 4) {
			String solutionStr = String.format("%.1f", otherMemberAvg);
			double solutionDouble = Double.parseDouble(solutionStr);
			otherMemberAvg = solutionDouble;
		}
		
		int cnt = mypageDao.avgplusorminus(otherMember.getMemId(), otherMemberAvg);
		
		return cnt;
		
	}//avgplus
	

	@Override
	public List<BlockMemberVO> getmyBlockMemList(MemberVO member) {
		String memId = member.getMemId();
		List<BlockMemberVO> blockMemList = mypageDao.getBlockmember(memId);
		return blockMemList;
	}

	@Override
	public String blockmemRemove(MemberVO blockMember, MemberVO myMember) {
		System.out.println("blockmemRemove 진입");
		String blockMemId = blockMember.getMemId();
		String myMemId = myMember.getMemId();
		
		int cnt = mypageDao.deleteBlockMember(blockMemId, myMemId);
		int avgcnt = avgplus(blockMember);
		if(cnt != 0 && avgcnt != 0) {
			return "success";
		}else {
			return "error";
		}
		
	}//blockmemRemove

	@Override
	public String blockmemService(MemberVO blockMember, MemberVO myMember) {
		
		String blockMemId = blockMember.getMemId();
		String blockMemNick = blockMember.getMemNickname();
		String myMemId = myMember.getMemId();
		int blockCount = blockmemcount(myMember);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("blockMemId", blockMemId);
		map.put("blockMemNick", blockMemNick);
		map.put("myMemId", myMemId);
		
		BlockMemberVO blockCheck = mypageDao.blockOverlap(myMemId, blockMemId);
		System.out.println(blockMemId + myMemId);
		
		if(blockCount >= 5) {
			return "toomany";
		}else if(blockCheck != null) {
			return "overlap";
		}else if(blockMemId.equals(myMemId)) {
			return "itsme";
		}else{
			int cnt = mypageDao.insertBlockMember(map);
			int avgcnt = avgminus(blockMember);
			if(cnt != 0 && avgcnt != 0) {
				return "success";
			}else {
				return "error";
			}
		}
	}//blockService

	@Override
	public String secretId(String memId) {
		String star = "";
		int backnum = 0;
		String front = "";
		if(memId.length() <= 5) {
			front = memId.substring(0, memId.length()-2);
			backnum = (memId.length()) - (memId.length()-2);
		}else {
			front = memId.substring(0, memId.length()-4);
			backnum = (memId.length()) - (memId.length()-4);
		}
		
		for(int i = 0; i < backnum; i++) {
			star += "*";
		}
		String back = star;
		String hap = front + back;
		
		
		return hap;
	}

	
	
	

}
