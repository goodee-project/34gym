package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.debug;
import com.gd.gym.service.MembershipPriceService;
import com.gd.gym.vo.MembershipPrice;

@Controller
public class MembershipPriceController {
	@Autowired MembershipPriceService membershipPriceService;
	debug de = new debug();
	
	// 운동이용권 1개월 비용 조회 (목록) 맵핑
	@GetMapping("/getMembershipPriceList")
	public String getMembershipPriceList(Model model) {
		// 서비스 호출
		List<MembershipPrice> membershipPriceList = membershipPriceService.getMembershipPriceList();
		de.debugging("getMembershipPriceList", "membershipPriceList", membershipPriceList.toString());
		
		// model에 담기
		model.addAttribute("membershipPriceList", membershipPriceList);
		
		return "getMembershipPriceList";
	}
	
	// 운동이용권 1개월 비용 추가 맵핑
	
	// 운동이용권 1개월 비용 수정 맵핑
	
	// 운동이용권 1개월 비용 삭제 맵핑
	@GetMapping("/removeMembershipPrice")
	public String removeMembershipPrice(@RequestParam(value="membershipPriceId", required = true) int membershipPriceId) {
		// 매개변수 디버깅
		de.debugging("removeMembershipPrice", "membershipPriceId", membershipPriceId);
		
		// 서비스 호출
		membershipPriceService.removeMembershipPrice(membershipPriceId);
		
		return "redirect:/getMembershipPriceList";
	}
}
