package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MembershipMemberInbodyService;
import com.gd.gym.vo.LectureRoom;
import com.gd.gym.vo.Member;
import com.gd.gym.vo.MembershipMemberInbody;

@Controller
public class MembershipMemberInbodyController {
	@Autowired MembershipMemberInbodyService membershipMemberInbodyService;
	@Autowired Debug de;
	
	// 트레이너가 관리하는 인바디 목록
	@GetMapping("/trainer/getMembershipMemberInbodyList")
	public String getMembershipMemberInbodyList(HttpSession session, Model model) {
		session.getAttribute("loginBranch");
		
		List<Map<String, Object>> membershipMemberInbodyList = membershipMemberInbodyService.getMembershipMemberInbodyList();
		de.debugging("getMembershipMemberInbodyList", "Controller membershipMemberInbodyList", membershipMemberInbodyList.toString());
		
		model.addAttribute("membershipMemberInbodyList", membershipMemberInbodyList);
		return "trainer/getMembershipMemberInbodyList";
	}
	
	// 운동이용권 회원 인바디 입력 폼
	@GetMapping("/trainer/addMembershipMemberInbody")
	public String addMembershipMemberInbody() {
		return "trainer/addMembershipMemberInbody";
	}
	
	// 운동이용권 회원 인바디 입력 엑션
	@PostMapping("/trainer/addMembershipMemberInbody")
	public String addMembershipMemberInbody(MembershipMemberInbody membershipMemberInbody) {
		de.debugging("addMembershipMemberInbody", "Controller membershipMemberInbody", membershipMemberInbody.toString());
		
		membershipMemberInbodyService.addMembershipMemberInbody(membershipMemberInbody);
		return "redirect:/member/getMemberMyPage";
	}
	
	// 회원이 보는 인바디 목록
	@GetMapping("/member/getMembershipMemberInbodyListById")
	public String getMembershipMemberInbodyListById(HttpSession session, Model model) {
		int memberId = 0;
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 로그인정보 담겨있으면 memberId 가공
		if(loginMember != null) {
			memberId = loginMember.getMemberId();
		}
				
		List<Map<String, Object>> membershipMemberInbodyList = membershipMemberInbodyService.getMembershipMemberInbodyListById(memberId);
		de.debugging("getMembershipMemberInbodyListById", "Controller membershipMemberInbodyList", membershipMemberInbodyList.toString());
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("membershipMemberInbodyList", membershipMemberInbodyList);
		return "member/getMembershipMemberInbodyListById";
	}
	
	// 운동이용권 회원 인바디 상세보기
	@GetMapping("/member/getMembershipMemberInbodyOne")
	public String getMembershipMemberInbodyOne(Model model,
			@RequestParam(value="membershipMemberInbodyId", required = true) Integer membershipMemberInbodyId) {
				
		Map<String, Object> membershipMemberInbody = membershipMemberInbodyService.getMembershipMemberInbodyOne(membershipMemberInbodyId);
		de.debugging("getMembershipMemberInbodyList", "Controller membershipMemberInbody", membershipMemberInbody.toString());
		
		model.addAttribute("membershipMemberInbodyId", membershipMemberInbodyId);
		model.addAttribute("membershipMemberInbody", membershipMemberInbody);
		return "member/getMembershipMemberInbodyOne";
	}
}
