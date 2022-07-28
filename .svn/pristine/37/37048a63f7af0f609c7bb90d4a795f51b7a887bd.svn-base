package com.babpool.market.vo;

import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Positive;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.babpool.attach.vo.AttachVO;
import com.babpool.common.valid.Modify;

public class MarketVO {
	
	@Positive(message = "글 번호는 양수여야 합니다.", groups = { Modify.class })
	private int marketNo;    		/* 글 번호 */       
	private String marketTitle;       /* 글 제목 */     
	private String marketContent;     /* 글 내용 */               
	private String marketNickname;    /* 등록할 때 닉네임 */
	private String marketPrice;    		/* 가격 */
	private String marketRegDate;     /* 등록한 시간 */     
	private String marketModDate;     /* 수정한 시간 */     
	private String marketDelYn;       /* 삭제 여부 */    
	private String marketComYn;			/* 완료 여부 */
	private String marketCategory;		/* 카테고리 */
	private String marketId;				/* 멤버 아이디 */
	private int marketHit;				/* 조회수 */
	private int marketLike;				/* 찜 */
	
	private List<AttachVO> attaches ; /*첨부파일 리스트    */ 
	private int[] delAtchNos;         /*삭제를 위한 글 번호  */
	private double memLevel;				/* 밥풀 갯수  */	
	
	@Override 
	  public String toString() {
		  return ToStringBuilder.reflectionToString(this,
				  ToStringStyle.MULTI_LINE_STYLE); 
		}
	
	public int getMarketNo() {
		return marketNo;
	}
	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}
	public String getMarketTitle() {
		return marketTitle;
	}
	public void setMarketTitle(String marketTitle) {
		this.marketTitle = marketTitle;
	}
	public String getMarketContent() {
		return marketContent;
	}
	public void setMarketContent(String marketContent) {
		this.marketContent = marketContent;
	}
	public String getMarketNickname() {
		return marketNickname;
	}
	public void setMarketNickname(String marketNickname) {
		this.marketNickname = marketNickname;
	}
	
	public String getMarketPrice() {
		return marketPrice;
	}

	public void setMarketPrice(String marketPrice) {
		this.marketPrice = marketPrice;
	}

	public String getMarketRegDate() {
		return marketRegDate;
	}
	public void setMarketRegDate(String marketRegDate) {
		this.marketRegDate = marketRegDate;
	}
	public String getMarketModDate() {
		return marketModDate;
	}
	public void setMarketModDate(String marketModDate) {
		this.marketModDate = marketModDate;
	}
	public String getMarketDelYn() {
		return marketDelYn;
	}
	public void setMarketDelYn(String marketDelYn) {
		this.marketDelYn = marketDelYn;
	}
	public String getMarketComYn() {
		return marketComYn;
	}
	public void setMarketComYn(String marketComYn) {
		this.marketComYn = marketComYn;
	}

	public List<AttachVO> getAttaches() {
		return attaches;
	}

	public void setAttaches(List<AttachVO> attaches) {
		this.attaches = attaches;
	}

	public int[] getDelAtchNos() {
		return delAtchNos;
	}

	public void setDelAtchNos(int[] delAtchNos) {
		this.delAtchNos = delAtchNos;
	}

	public String getMarketCategory() {
		return marketCategory;
	}

	public void setMarketCategory(String marketCategory) {
		this.marketCategory = marketCategory;
	}

	public String getMarketId() {
		return marketId;
	}

	public void setMarketId(String marketId) {
		this.marketId = marketId;
	}

	public double getMemLevel() {
		return memLevel;
	}

	public void setMemLevel(double memLevel) {
		this.memLevel = memLevel;
	}

	public int getMarketHit() {
		return marketHit;
	}

	public void setMarketHit(int marketHit) {
		this.marketHit = marketHit;
	}

	public int getMarketLike() {
		return marketLike;
	}

	public void setMarketLike(int marketLike) {
		this.marketLike = marketLike;
	}     
	
}
