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

import com.gd.gym.debug.Debug;
import com.gd.gym.service.BranchService;
import com.gd.gym.service.MembershipMemberService;
import com.gd.gym.service.MembershipPriceService;
import com.gd.gym.vo.Branch;
import com.gd.gym.vo.Member;
import com.gd.gym.vo.MembershipMemberForm;
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
	public String addMembershipMember(MembershipMemberForm membershipMemberForm) {
		membershipMemberService.addMembershipMember(membershipMemberForm);
		return "redirect:/member/memberLogin";
	}
	
	// 구매한 운동이용권 목록 맵핑
	@GetMapping("/member/getMembershipByMember")
	public String getMembershipByMember(HttpServletRequest request, Model model) {
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		int memberId = ((Member) session.getAttribute("loginMember")).getMemberId();
		
		// 서비스 호출
		List<Map<String,Object>> membershipByMemberList = membershipMemberService.getMembershipByMemberList(memberId);
		de.debugging("getMembershipByMember", "membershipByMemberList", membershipByMemberList.toString());
		
		// model
		model.addAttribute("membershipByMemberList", membershipByMemberList);
		
		return "member/getMembershipByMember";
	}
}
