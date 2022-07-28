package com.babpool.notice.vo;

public class NoticeVO {
	private int noticeNo;                             
	private String noticeTitle;             
	private String noticeContent;           
	private String noticeWriter;            
	private int noticeLike;                 
	private String noticeRegDate;           
	private String noticeModDate;           
	private String noticeDelYn;             
	private String noticePass;   
	private int rnum;
	
	public NoticeVO() {
		
	}
	
	public NoticeVO(int noticeNo, String noticeTitle, String noticeContent,
			String noticeWriter, int noticeLike, String noticeRegDate, String noticeModDate, String noticeDelYn,
			String noticePass, int noticeRnum) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeWriter = noticeWriter;
		this.noticeLike = noticeLike;
		this.noticeRegDate = noticeRegDate;
		this.noticeModDate = noticeModDate;
		this.noticeDelYn = noticeDelYn;
		this.noticePass = noticePass;
		this.rnum = noticeRnum;
	}



	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo 
				+ ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent + ", noticeWriter=" + noticeWriter
				+ ", noticeLike=" + noticeLike + ", noticeRegDate=" + noticeRegDate + ", noticeModDate=" + noticeModDate
				+ ", noticeDelYn=" + noticeDelYn + ", noticePass=" + noticePass + ",noticeRnum=" + rnum + "] ";
	}



	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public int getNoticeLike() {
		return noticeLike;
	}

	public void setNoticeLike(int noticeLike) {
		this.noticeLike = noticeLike;
	}

	public String getNoticeRegDate() {
		return noticeRegDate;
	}

	public void setNoticeRegDate(String noticeRegDate) {
		this.noticeRegDate = noticeRegDate;
	}

	public String getNoticeModDate() {
		return noticeModDate;
	}

	public void setNoticeModDate(String noticeModDate) {
		this.noticeModDate = noticeModDate;
	}

	public String getNoticeDelYn() {
		return noticeDelYn;
	}

	public void setNoticeDelYn(String noticeDelYn) {
		this.noticeDelYn = noticeDelYn;
	}

	public String getNoticePass() {
		return noticePass;
	}

	public void setNoticePass(String noticePass) {
		this.noticePass = noticePass;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	
	
	
}
