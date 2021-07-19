package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MembershipService;

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
}
