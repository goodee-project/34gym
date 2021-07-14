package com.gd.gym.service;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service // 붙어있어야 객체가 만들어짐
@Transactional // spring에 트랜잭션기능이 있다. 어떤 메서드를 실행하다가 에러가뜨면 그 메서드가 있는 서비스 롤백
public class MailService {
	
	@Autowired JavaMailSender javaMailSender;

	public void sendMail(HttpSession session, String userMail) {

		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		Random random = new Random(System.currentTimeMillis());
		int result = 100000 + random.nextInt(900000);

		simpleMailMessage.setTo(userMail);
		// simpleMailMessage.setFrom("cucudoktest@gmail.com");
		simpleMailMessage.setSubject("인증번호입니다");

		String text = "인증번호 : " + result;

		simpleMailMessage.setText(text);

		javaMailSender.send(simpleMailMessage);

		session.setAttribute(userMail, result);
	}
}
