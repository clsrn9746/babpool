package com.babpool.member.vo;

public class FavoriteMemberVO {
	private String memId;                   
	private String favMemid;   
	private String favMemNick;
	
	
	@Override
	public String toString() {
		return "FavoriteMemberVO [memId=" + memId + ", favMemid=" + favMemid + ", favMemNick=" + favMemNick + "]";
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getFavMemid() {
		return favMemid;
	}

	public void setFavMemid(String favMemid) {
		this.favMemid = favMemid;
	}

	public String getFavMemNick() {
		return favMemNick;
	}

	public void setFavMemNick(String favMemNick) {
		this.favMemNick = favMemNick;
	}
	
	

}
