package com.babpool.market.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.babpool.common.vo.PagingVO;
import com.babpool.common.vo.SearchVO;
import com.babpool.market.vo.MarketVO;

@Mapper
public interface IMarketDao {
	public int getTotalRowCount(SearchVO searchVO);
	
	// 리스트 가져오기
	public List<MarketVO> getMarketList(SearchVO searchVO);
	// 메인에서 6개 보기
	public List<MarketVO> getMainMarketList();
	// 글 하나 보기
	public MarketVO getMarket(int marketNo);
	// 글 하나 등록
	public int insertMarket(MarketVO market);
	// 글 하나 삭제
	public int deleteMarket(MarketVO market);
	// 글 하나 수정
	public int updateMarket(MarketVO market);
	// 거래 완료 됐을 때
	public int completeMarket(MarketVO market);
	// 조회수
	public int updateHit(MarketVO market);
	// 찜 등록
	public int updateLike(MarketVO market);
	
	public MarketVO getChatMarket(int marketNo);
}
