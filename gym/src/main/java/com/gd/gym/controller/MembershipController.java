package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MembershipService;
import com.gd.gym.vo.Membership;

@Controller
public class MembershipController {
	@Autowired MembershipService membershipService;
	@Autowired Debug de;
	
	// 운동이용권 목록
	@GetMapping("/branch/getMembershipList")
	public String getMembershipList(Model model) {
		List<Map<String, Object>> membershipList = membershipService.getMembershipList();
		de.debugging("getMembershipList", "Controller membershipList", membershipList.toString());
		
		model.addAttribute("membershipList", membershipList);
		return "branch/getMembershipList";
	}
	
	// 운동이용권 수정 폼
	@GetMapping("/branch/modifyMembership")
	public String modifyMembership() {
		return "branch/modifyMembership";
	}
	
	// 운동이용권 수정 엑션
	@PostMapping("/branch/modifyMembership")
	public String modifyMembership(
			@RequestParam(value="membershipId", required = true) int membershipId) {
		de.debugging("modifyMembership", "Controller membershipId", membershipId);
		
		int modifyRow = membershipService.modifyMembership(membershipId);
		de.debugging("modifyMembership", "Controller modifyRow", modifyRow);
		return "redirect:/branch/getMembershipList";
	}
}
