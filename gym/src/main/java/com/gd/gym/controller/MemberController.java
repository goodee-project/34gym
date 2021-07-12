package com.gd.gym.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MemberService;
import com.gd.gym.vo.Member;

@Controller // 컴포넌트로 객체가 자동으로 만들어진다. 서블릿처럼 행동하는 클래스를 상속받음
public class MemberController {
	
	@Autowired private MemberService memberService;
	@Autowired private Debug debug;
	
	// addMember
	@GetMapping("/member/addMember")
	public String addMember() {
		return "member/addMember";
	}
	
	// memberLogin
	@GetMapping("/member/memberLogin")
	public String memberLogin() {
		return "member/memberLogin";
	}
	
	// addMember 맵핑	
	@PostMapping("/addMember")
	public String addMember(Member member) {
		int addRow = memberService.addMember(member);
		debug.debugging("addMember", addRow);
		
		return "member/memberLogin";
	}
	
	@GetMapping("/memberLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/member/memberLogin";
	}
	
	@PostMapping("/memberLogin")
	public String memberLogin(HttpSession session, Member member) { // 매개변수로 들어간건 스프링이 넣어주어야한다. , servlet 세션을 직접 사용, Controller 메서드의 매개변수는 DI대상이다.
		
		// 디버깅
		debug.debugging("memberLogin", "member", member.toString());
		
		// 받은 staff 객체를 이용해 login 시도
		Member loginMember = memberService.memberLogin(member);
		// 디버깅
		debug.debugging("memberLogin", "loginMember", loginMember.toString());
		
		// 로그인 성공
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
		}
		
		return "redirect:/member/memberLogin";
	}
}
