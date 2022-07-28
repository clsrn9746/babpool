package com.babpool.member.vo;

public class BlockMemberVO {
	private String memId;                   
	private String blockMemid;              
	private String blockMemnick;
	
	@Override
	public String toString() {
		return "BlockMemberVO [memId=" + memId + ", blockMemid=" + blockMemid + ", blockMemnick=" + blockMemnick + "]";
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getBlockMemid() {
		return blockMemid;
	}
	public void setBlockMemid(String blockMemid) {
		this.blockMemid = blockMemid;
	}
	public String getBlockMemnick() {
		return blockMemnick;
	}
	public void setBlockMemnick(String blockMemnick) {
		this.blockMemnick = blockMemnick;
	}            
	
	
}
