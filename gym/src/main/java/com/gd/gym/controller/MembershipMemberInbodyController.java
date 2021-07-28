package com.gd.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MembershipMemberInbodyService;
import com.gd.gym.vo.MembershipMemberInbody;

@Controller
public class MembershipMemberInbodyController {
	@Autowired MembershipMemberInbodyService membershipMemberInbodyService;
	@Autowired Debug de;
	
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
}
