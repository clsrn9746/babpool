package com.babpool.member.service;

import com.babpool.member.vo.MailAuthVO;

public interface IMailService {
	
	public void registMailAuth(String mail, String authKey);//부모창 mail 확인하기, 확인하기버튼 누르는 순간 인증키랑 mail 저장
	public int authKeyCompare(MailAuthVO mailAuth);
	//자식창 확인버튼, 사용자가 메일에서 인증번호 입력하면  DB에 있는 내용이랑 비교. 같으면 is_auth=1로 바꿔서 인증
	public int isMailAuthed(String mail) ; // 부모창 다음버튼, is_auth=1이면 1리턴해서 인증되었다는걸 알림

}
