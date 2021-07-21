package com.gd.gym.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.BranchService;
import com.gd.gym.service.MembershipMemberService;
import com.gd.gym.service.MembershipPriceService;
import com.gd.gym.vo.Branch;
import com.gd.gym.vo.MembershipMember;
import com.gd.gym.vo.MembershipPrice;

@Controller
public class MembershipMemberController {
	@Autowired MembershipMemberService membershipMemberService;
	@Autowired BranchService branchService;
	@Autowired MembershipPriceService membershipPriceService;
	@Autowired Debug de;
	
	// 운동권 구매 폼
	@GetMapping("/member/addMembershipMember")
	public String addMembershipMember(HttpSession session, Model model) {
		session.getAttribute("loginMember");
		
		List<Branch> branchNameList = branchService.getBranchNameList();
		de.debugging("addMembershipMember", "Controller branchNameList", branchNameList.toString());
		
		List<MembershipPrice> membershipNameList = membershipPriceService.getMembershipNameListbyId();
		de.debugging("addMembershipMember", "Controller membershipNameList", membershipNameList.toString());
		
		model.addAttribute("branchNameList", branchNameList);
		model.addAttribute("membershipNameList", membershipNameList);
		return "member/addMembershipMember";
	}
	
	// 운동권 구매 엑션
	@PostMapping("/member/addMembershipMember")
	public String addMembershipMember(MembershipMember membershipMember) {
		de.debugging("addMembershipMember", "Controller membershipMember", membershipMember.toString());
		
		int addRow = membershipMemberService.addMembershipMember(membershipMember);
		de.debugging("addMembershipMember", "Controller addRow", addRow);
		return "redirect:/member/memberLogin";
	}
}
