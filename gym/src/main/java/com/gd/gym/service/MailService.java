package com.gd.gym.service;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

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
