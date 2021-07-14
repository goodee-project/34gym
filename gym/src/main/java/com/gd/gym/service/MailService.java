package com.gd.gym.service;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MemberMapper;
import com.gd.gym.vo.Member;

@Service // 붙어있어야 객체가 만들어짐
@Transactional // spring에 트랜잭션기능이 있다. 어떤 메서드를 실행하다가 에러가뜨면 그 메서드가 있는 서비스 롤백
public class MailService {
	
	@Autowired JavaMailSender javaMailSender;
	@Autowired MemberMapper memberMapper;
	@Autowired Debug debug;

	public void sendMail(HttpSession session, String memberMail) {

		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		Random random = new Random(System.currentTimeMillis());
		int result = 100000 + random.nextInt(900000);

		simpleMailMessage.setTo(memberMail);
		// simpleMailMessage.setFrom("cucudoktest@gmail.com");
		simpleMailMessage.setSubject("인증번호입니다");

		String text = "인증번호 : " + result;

		simpleMailMessage.setText(text);

		javaMailSender.send(simpleMailMessage);

		session.setAttribute(memberMail, result);
	}
	
	public void PwSendMail(String memberMail) {
		
		SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
		Random random = new Random(System.currentTimeMillis());
		// 임시 비밀번호 설정
		int result = 10000000 + random.nextInt(90000000);

		String memberPw = "" + result;
		String textMemberPw = "임시 비밀번호 : " + memberPw;

		Member member = new Member();
		member.setMemberPw(memberPw);
		member.setMemberMail(memberMail);

		// Mapper 호출
		int updateRow = memberMapper.updateMemberPw(member);

		// updateRow 디버깅
		debug.debugging("PwSendMail", "updateRow", updateRow);

		simpleMailMessage.setTo(memberMail);
		// simpleMailMessage.setFrom("cucudoktest@gmail.com");
		simpleMailMessage.setSubject("임시 비밀번호입니다");

		simpleMailMessage.setText(textMemberPw);

		javaMailSender.send(simpleMailMessage);
	}

}
