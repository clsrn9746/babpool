package com.babpool.reply.vo;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

public class ReplyVO {
	private int reNo;                       
	private int reBoardNo;                  
	private String reParentCate;            
	private String reWriter;                
	private String reRegDate;               
	private String reModDate;               
	private String reDelYn;                 
	private String reContent;               
	private String reWriterId;              
	private String reSecret;                
	private int reParentId;
	private int lv;
	
	
	public int getReNo() {
		return reNo;
	}
	public void setReNo(int reNo) {
		this.reNo = reNo;
	}
	public int getReBoardNo() {
		return reBoardNo;
	}
	public void setReBoardNo(int reBoardNo) {
		this.reBoardNo = reBoardNo;
	}
	public String getReParentCate() {
		return reParentCate;
	}
	public void setReParentCate(String reParentCate) {
		this.reParentCate = reParentCate;
	}
	public String getReWriter() {
		return reWriter;
	}
	public void setReWriter(String reWriter) {
		this.reWriter = reWriter;
	}
	public String getReRegDate() {
		return reRegDate;
	}
	public void setReRegDate(String reRegDate) {
		this.reRegDate = reRegDate;
	}
	public String getReModDate() {
		return reModDate;
	}
	public void setReModDate(String reModDate) {
		this.reModDate = reModDate;
	}
	public String getReDelYn() {
		return reDelYn;
	}
	public void setReDelYn(String reDelYn) {
		this.reDelYn = reDelYn;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReWriterId() {
		return reWriterId;
	}
	public void setReWriterId(String reWriterId) {
		this.reWriterId = reWriterId;
	}
	public String getReSecret() {
		return reSecret;
	}
	public void setReSecret(String reSecret) {
		this.reSecret = reSecret;
	}
	public int getReParentId() {
		return reParentId;
	}
	public void setReParentId(int reParentId) {
		this.reParentId = reParentId;
	}
	@Override
	public String toString() {
		return "ReplyVO [reNo=" + reNo + ", reBoardNo=" + reBoardNo + ", reParentCate=" + reParentCate + ", reWriter="
				+ reWriter + ", reRegDate=" + reRegDate + ", reModDate=" + reModDate + ", reDelYn=" + reDelYn
				+ ", reContent=" + reContent + ", reWriterId=" + reWriterId + ", reSecret=" + reSecret + ", reParentId="
				+ reParentId + ", level=" + lv + "]";
	}
	public int getLv() {
		return lv;
	}
	public void setLv(int lv) {
		this.lv = lv;
	}                 
	
	
}
