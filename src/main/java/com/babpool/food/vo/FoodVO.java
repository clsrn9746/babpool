package com.babpool.food.vo;

public class FoodVO {

	private int foodNo;                     
	private String foodTitle;               
	private String foodAddress;             
	private int foodScore;                  
	private String foodIntro;               
	private String foodImg;                 
	private String foodOpentime;            
	private String foodClosetime;           
	private String foodPhone;               
	private String foodRelativetag;         
	private String foodMenu;                
	private String foodCategory;
	
	
	public int getFoodNo() {
		return foodNo;
	}
	public void setFoodNo(int foodNo) {
		this.foodNo = foodNo;
	}
	public String getFoodTitle() {
		return foodTitle;
	}
	public void setFoodTitle(String foodTitle) {
		this.foodTitle = foodTitle;
	}
	public String getFoodAddress() {
		return foodAddress;
	}
	public void setFoodAddress(String foodAddress) {
		this.foodAddress = foodAddress;
	}
	public int getFoodScore() {
		return foodScore;
	}
	public void setFoodScore(int foodScore) {
		this.foodScore = foodScore;
	}
	public String getFoodIntro() {
		return foodIntro;
	}
	public void setFoodIntro(String foodIntro) {
		this.foodIntro = foodIntro;
	}
	public String getFoodImg() {
		return foodImg;
	}
	public void setFoodImg(String foodImg) {
		this.foodImg = foodImg;
	}
	public String getFoodOpentime() {
		return foodOpentime;
	}
	public void setFoodOpentime(String foodOpentime) {
		this.foodOpentime = foodOpentime;
	}
	public String getFoodClosetime() {
		return foodClosetime;
	}
	public void setFoodClosetime(String foodClosetime) {
		this.foodClosetime = foodClosetime;
	}
	public String getFoodPhone() {
		return foodPhone;
	}
	public void setFoodPhone(String foodPhone) {
		this.foodPhone = foodPhone;
	}
	public String getFoodRelativetag() {
		return foodRelativetag;
	}
	public void setFoodRelativetag(String foodRelativetag) {
		this.foodRelativetag = foodRelativetag;
	}
	public String getFoodMenu() {
		return foodMenu;
	}
	public void setFoodMenu(String foodMenu) {
		this.foodMenu = foodMenu;
	}
	public String getFoodCategory() {
		return foodCategory;
	}
	public void setFoodCategory(String foodCategory) {
		this.foodCategory = foodCategory;
	}
	
	
	@Override
	public String toString() {
		return "FoodVO [foodNo=" + foodNo + ", foodTitle=" + foodTitle + ", foodAddress=" + foodAddress + ", foodScore="
				+ foodScore + ", foodIntro=" + foodIntro + ", foodImg=" + foodImg + ", foodOpentime=" + foodOpentime
				+ ", foodClosetime=" + foodClosetime + ", foodPhone=" + foodPhone + ", foodRelativetag="
				+ foodRelativetag + ", foodMenu=" + foodMenu + ", foodCategory=" + foodCategory + "]";
	}            
	
	
	
	
}
