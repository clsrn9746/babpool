package com.babpool.member.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {
    @Autowired   //context-mail에서 빈 등록했기 때문에 주입받을 수 있다. Spring에서 제공하는 MailSender. 
    private JavaMailSenderImpl mailSender;
    
    
    private String getKey() {
    	String key = "";
    	for(int i = 0; i < 6; i++) {
	    	int rand = (int)(Math.random() * 10);
	    	key += rand;
    	}
        return key;
    }
    
    private String getRandString() {
    	int size = 10;
		char[] tmp = new char[size];
		for(int i = 0; i < tmp.length; i++) {
			int div = (int) Math.floor(Math.random() * 2);
			
			if(div == 0) { //0이면 숫자로
				tmp[i] = (char)(Math.random() * 10 + '0');
			}else { //1이면 알파벳
				tmp[i] = (char)(Math.random() * 26 + 'A');
			}
			
		}//for
		return new String(tmp);
    }
    
    public String sendAuthMail(String mail)  throws MessagingException{
        String authKey = getKey();
        SimpleMailMessage smm = new SimpleMailMessage();
        String mailContent = "인증번호 :   "+authKey ;     //보낼 메시지 
		        	smm.setFrom("b0rum@naver.com");
		        	smm.setTo(mail);
		        	smm.setSubject("밥풀 메일인증");
		        	smm.setText(mailContent);
		        	mailSender.send(smm);
          return authKey;
    }
    
    public String sendRandPw(String mail) throws MessagingException {
    	String randString = getRandString();
    	SimpleMailMessage smm = new SimpleMailMessage();
       String mailContent = "임시비밀번호 :   "+randString ;     //보낼 메시지 
       smm.setFrom("b0rum@naver.com");
       smm.setTo(mail);
       smm.setSubject("밥풀 임시 비밀번호 발급");
       smm.setText(mailContent);
    	mailSender.send(smm);
    	   
       
    	return randString;
    }
}//class
