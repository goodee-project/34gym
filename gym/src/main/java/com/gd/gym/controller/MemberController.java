package com.gd.gym.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.BranchMemberMapper;
import com.gd.gym.service.MailService;
import com.gd.gym.service.MemberService;
import com.gd.gym.vo.BranchMember;
import com.gd.gym.vo.CurrentLectureMember;
import com.gd.gym.vo.Member;

@Controller // 컴포넌트로 객체가 자동으로 만들어진다. 서블릿처럼 행동하는 클래스를 상속받음
public class MemberController {
	
	@Autowired private MemberService memberService;
	@Autowired private BranchMemberMapper branchMemberMapper;
	@Autowired private Debug debug;
	@Autowired private MailService mailService;
	
	// addMember
	@GetMapping("/member/addMember")
	public String addMember() {
		return "member/addMember";
	}
	
	// memberLogin
	@GetMapping("/memberLogin")
	public String memberLogin() {
		return "memberLogin";
	}
	
	// addMember 맵핑	
	@PostMapping("/addMember")
	public String addMember(Member member) {
		int addRow = memberService.addMember(member);
		debug.debugging("addMember", addRow);
		
		return "redirect:/memberLogin";
	}
	
	// 로그아웃 맵핑
	@GetMapping("/memberLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 마이페이지 맵핑
	@GetMapping("/member/getMemberMyPage")
	public String memberMyPage() {
		return "member/getMemberMyPage";
	}

	// 회원탈퇴폼 맵핑
	@GetMapping("/member/removeMemberForm")
	public String removeMemberForm() {
		return "member/removeMemberForm";
	}
	
	// 회원탈퇴 맵핑
	@PostMapping("/removeMember")
	public String removeMember(HttpSession session, Member member) {

		// memberId 디버깅
		debug.debugging("removeMember", "memberMail", member.getMemberMail());
		// memberPw 디버깅
		debug.debugging("removeMember", "memberPw", member.getMemberPw());

		// Service 호출
		int removeMemberRow = memberService.removeMember(member);
		debug.debugging("removeMember", "removeMemberRow", removeMemberRow);
		session.invalidate();

		return "redirect:/memberLogin";
	}

	// 로그인 맵핑
	@PostMapping("/memberLogin")
	public String memberLogin(HttpSession session, Member member, BranchMember branchMember) { // 매개변수로 들어간건 스프링이 넣어주어야한다. , servlet 세션을 직접 사용, Controller 메서드의 매개변수는 DI대상이다.
		
		// member 객체 디버깅
		debug.debugging("memberLogin", "member", member.toString());
		
		// 받은 member 객체를 이용해 login 시도
		Member loginMember = memberService.memberLogin(member);
		// loginMember 확인 디버깅
		debug.debugging("memberLogin", "loginMember", loginMember.toString());
		
		// login 시도시 지점 데이터 있는지 확인
		BranchMember loginBranch = branchMemberMapper.selectMemberLoginByBranch(branchMember);

		// 로그인 성공
		if(loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			
			//회원이 강좌회원인지 확인
			List<CurrentLectureMember> lectureInfo = memberService.getLectureMember(loginMember.getMemberId());
			// 강좌회원 확인 디버깅
			debug.debugging("memberLogin", "lectureInfo", lectureInfo.toString());
			
			//듣는강좌가 있다면
			if(lectureInfo.size() > 0) {
				//세션에 회원이 듣는 강좌들 정보 담기
				session.setAttribute("lectureInfo", lectureInfo);
				//디버깅
				debug.debugging("memberLogin", "lectureInfo 세션저장완료");
			}
		}
		// 지점 데이터 존재시 세션저장
		if (loginBranch != null) {
			debug.debugging("memberLogin", "BranchMember 세션저장완료");
			session.setAttribute("loginBranch", loginBranch);
		}

		return "memberLogin";
	}
	
	// 비밀번호찾기폼 맵핑
	@GetMapping("/member/findMemberPwForm")
	public String findMemberPwForm(String memberMail) {
		return "member/findMemberPwForm";
	}

	// findMemberPw 맵핑
	@PostMapping("/findMemberPw")
	public String findMemberPw(@RequestParam(value = "memberMail", required = true) String memberMail) {
		// memberMail 확인 디버깅
		debug.debugging("findMemberPw", "memberMail", memberMail);

		// 서비스 호출
		mailService.PwSendMail(memberMail);

		return "redirect:/memberLogin";
	}
	
	// 회원수정
	@GetMapping("/member/modifyMemberForm")
	public String modifyMember(HttpServletRequest request, Model model) {
		
		// 세션 가져오기
		/*
		 * HttpSession session = request.getSession(); int memberId =
		 * ((Member)session.getAttribute("loginMember")).getMemberId();
		 */
		
		// test용
		int memberId = 1;
		
		// 서비스 호출
		Member memberOne = memberService.getMemberOne(memberId);
		debug.debugging("modifyMember", "memberList", memberOne.toString());
		
		model.addAttribute("memberList", memberOne);
		
		return "member/modifyMemberForm";
	}
	
	@PostMapping("/modifyMember")
	public String modifyMember(Member member) {
		
		// 디버깅
		debug.debugging("modifyMember", "member", member.toString());
		
		// 서비스 호출
		int modifyRow = memberService.modifyMember(member);
		debug.debugging("modifyMember", "modifyRow", modifyRow);
		
		return "redirect:/member/modifyMemberForm";
	}
}
