package com.gd.gym.service;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.MailHandler;


@Service // 붙어있어야 객체가 만들어짐
@Transactional // spring에 트랜잭션기능이 있다. 어떤 메서드를 실행하다가 에러가뜨면 그 메서드가 있는 서비스 롤백
public class MailService {
	
	private JavaMailSenderImpl JavaMailSenderImpl;
	
	public void sendMail(HttpSession session, String userMail) {
		try {
			MailHandler mailHandler = new MailHandler(JavaMailSenderImpl);
			Random random = new Random(System.currentTimeMillis());
			long start = System.currentTimeMillis();
			
			int result = 100000 + random.nextInt(900000);
			
			// 받는 사람
			mailHandler.setTo(userMail);
			
			// 보내는 사람
			mailHandler.setFrom("cucudok2112@gmail.com");
			
			// 제목
			mailHandler.setSubject("인증번호입니다");
			
			// HTML Layout
			String htmlContent = "<p>인증번호 : + " + result + "<p>";
			mailHandler.setText(htmlContent, true);
			
			mailHandler.send();
			
			long end = System.currentTimeMillis();
			
			session.setAttribute(userMail, result);
			System.out.println("실행 시간 : " + (end - start)/1000.0);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
