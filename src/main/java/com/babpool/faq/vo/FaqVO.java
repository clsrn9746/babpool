package com.babpool.faq.vo;

public class FaqVO {
	private int faqNo;                      
	private String faqQuestion;             
	private String faqAnswer;
	
	public FaqVO(int faqNo, String faqQuestion, String faqAnswer) {
		super();
		this.faqNo = faqNo;
		this.faqQuestion = faqQuestion;
		this.faqAnswer = faqAnswer;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", faqQuestion=" + faqQuestion + ", faqAnswer=" + faqAnswer + "]";
	}
	
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getFaqQuestion() {
		return faqQuestion;
	}
	public void setFaqQuestion(String faqQuestion) {
		this.faqQuestion = faqQuestion;
	}
	public String getFaqAnswer() {
		return faqAnswer;
	}
	public void setFaqAnswer(String faqAnswer) {
		this.faqAnswer = faqAnswer;
	}        
	
	
}
