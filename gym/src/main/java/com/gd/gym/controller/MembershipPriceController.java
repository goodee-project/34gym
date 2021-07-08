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
import com.gd.gym.service.MembershipPriceService;
import com.gd.gym.vo.MembershipPrice;

@Controller
public class MembershipPriceController {
	@Autowired MembershipPriceService membershipPriceService;
	@Autowired Debug de;
	
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
	@GetMapping("/addMembershipPrice")
	public String addMembershipPrice() {
		return "addMembershipPrice";
	}
	
	@PostMapping("/addMembershipPrice")
	public String addMembershipPrice(MembershipPrice membershipPrice) {
		// 매개변수 디버깅
		de.debugging("addMembershipPrice", "membershipPrice", membershipPrice.toString());
		
		// 서비스 호출
		int addMembershipPriceRow = membershipPriceService.addMembershipPrice(membershipPrice);
		de.debugging("addMembershipPrice", "addMembershipPriceRow", addMembershipPriceRow);
		
		return "redirect:/getMembershipPriceList";
	}
	
	// 운동이용권 1개월 비용 수정 맵핑
	@GetMapping("/modifyMembershipPrice")
	public String modifyMembershipPrice(Model model, @RequestParam(value="membershipPriceId") int membershipPriceId) {
		// 매개변수 디버깅
		de.debugging("modifyMembershipPrice", "membershipPriceId", membershipPriceId);
		
		// 서비스 호출
		Map<String, Object> membershipPriceOne = membershipPriceService.getMembershipPriceById(membershipPriceId);
		de.debugging("modifyMembershipPrice", "membershipPriceById", membershipPriceOne.toString());
		
		model.addAttribute("membershipPriceOne", membershipPriceOne);
		return "modifyMembershipPrice";
	}
	
	@PostMapping("/modifyMembershipPrice")
	public String modifyMembershipPrice(MembershipPrice membershipPrice) {
		// 매개변수 디버깅
		de.debugging("modifyMembershipPrice", "membershipPrice", membershipPrice.toString());
		
		// 서비스 호출
		int modifyMembershipPriceRow = membershipPriceService.modifyMembershipPrice(membershipPrice);
		de.debugging("modifyMembershipPrice", "modifyMembershipPriceRow", modifyMembershipPriceRow);
		
		return "redirect:/getMembershipPriceList";
	}
	
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
