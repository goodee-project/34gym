package com.gd.gym.restapi;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MailService;
import com.gd.gym.service.MemberService;

@RestController
@CrossOrigin
public class MemberRestController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private Debug debug;
	@Autowired
	private MailService mailService;

	@PostMapping("/getMailCheck")
	@ResponseBody
	public Integer getMailCheck(@RequestParam(value = "memberMail", required = true) String memberMail) {

		// 디버깅
		debug.debugging("getMailCheck", "memberMail", memberMail);

		return memberService.getMailCheck(memberMail);
	}

	// 이메일로 인증번호 보내기
	@PostMapping("/getMailAuth")
	@ResponseBody
	public int getMailAuth(HttpServletRequest request, String userMail) {
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		
		// 서비스 호출
		mailService.sendMail(session, userMail);
		return 1;
	}

	// 인증번호 비교
	@PostMapping("/verifCodeCheck")
	@ResponseBody
	public int verifCodeCheck(HttpServletRequest request, int verifCode, String memberMail) {
		// 디버깅
		debug.debugging("verifCodeCheck", "verifCode", verifCode);
		debug.debugging("verifCodeCheck", "userMail", memberMail);

		// 인증번호 가져오기
		HttpSession session = request.getSession();
		int result = (int) session.getAttribute(memberMail);

		// 디버깅 
		debug.debugging("verifCodeCheck", "result", result);
		
		if(result != verifCode) {
			return 0;
		}
		else {
			return 1;
		}
	}
}
