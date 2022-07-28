package com.babpool.food.vo;

public class RecommendVO {
	private String memberId;                
	private int foodNo;                     
	private String recommendDate;           
	private String recommendScore;          
	private String memberNicname;           
	private String memberProfile;
	
	
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}
	public String getRecommendDate() {
		return recommendDate;
	}
	public void setRecommendDate(String recommendDate) {
		this.recommendDate = recommendDate;
	}
	public String getRecommendScore() {
		return recommendScore;
	}
	public void setRecommendScore(String recommendScore) {
		this.recommendScore = recommendScore;
	}
	public String getMemberNicname() {
		return memberNicname;
	}
	public void setMemberNicname(String memberNicname) {
		this.memberNicname = memberNicname;
	}
	public String getMemberProfile() {
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
	
	
	@Override
	public String toString() {
		return "RecommendVO [memberId=" + memberId + ", foodNo=" + foodNo + ", recommendDate=" + recommendDate
				+ ", recommendScore=" + recommendScore + ", memberNicname=" + memberNicname + ", memberProfile="
				+ memberProfile + "]";
	}           
	
	

}
