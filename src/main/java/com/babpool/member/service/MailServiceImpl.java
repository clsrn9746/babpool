package com.babpool.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.babpool.member.dao.MemberDao;
import com.babpool.member.vo.MailAuthVO;

@Service
public class MailServiceImpl implements IMailService {
	
	@Autowired
	MemberDao memberDao;


	@Override
	public void registMailAuth(String mail, String authKey) {
		MailAuthVO mailAuth= memberDao.getMailAuth(mail);
        if(mailAuth==null)memberDao.insertMailAuth(mail, authKey);
        else {
        	memberDao.updateMailAuth(mail, authKey);
        }
	}

	@Override
	public int authKeyCompare(MailAuthVO mailAuth) {
		MailAuthVO vo = memberDao.getMailAuth(mailAuth.getMail()); //왠만하면 null안나옴. 자식창에서 확인바로누르면.
       // vo는 DB에 있는 거, mailAuth는 자식창에서 입력한 값
//        if(!vo.getAuthKey().equals(mailAuth.getAuthKey())) {
         //   throw new BizPasswordNotMatchedException();
            //자식창에서 입력한 authKey가 다르면
//        }
        if(vo.getAuthKey().equals(mailAuth.getAuthKey())) {  //인증번호 제대로 입력했으면
            int cnt = memberDao.completeAuth(mailAuth.getMail());
            return cnt;
        }else {
        	return 0;
        }
	}

	@Override
	public int isMailAuthed(String mail) {
		 MailAuthVO mailAuth = memberDao.getMailAuth(mail);
        if(mailAuth==null) return 0;
        return mailAuth.getIsAuth();
	}

	
	
}
