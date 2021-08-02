
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
	@GetMapping("/addMembershipMember")
	public String addMembershipMember(HttpSession session, Model model) {
		int memberId = 0;
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 로그인정보 담겨있으면 memberId 가공
		if(loginMember != null) {
			memberId = loginMember.getMemberId();
		}
		
		List<Branch> branchNameList = branchService.getBranchNameList();
		de.debugging("addMembershipMember", "Controller branchNameList", branchNameList.toString());
		
		List<MembershipPrice> membershipNameList = membershipPriceService.getMembershipNameListbyId();
		de.debugging("addMembershipMember", "Controller membershipNameList", membershipNameList.toString());
		
		model.addAttribute("branchNameList", branchNameList);
		model.addAttribute("membershipNameList", membershipNameList);
		return "addMembershipMember";
	}
	
	// 운동권 구매 엑션
	@PostMapping("/addMembershipMember")
	public String addMembershipMember(MembershipMemberForm membershipMemberForm) {
		// 결제 준비
		Map<String, Object> map = membershipMemberService.readyKakaoPay(membershipMemberForm, "http://localhost/gym/successMembershipMember");
		
		// 웹이였을 경우의 url , 앱이나 모바일 웹은 다르다.
		return "redirect:" + map.get("next_redirect_pc_url");
	}
	
	
	// 회원 강좌 결제 성공
	@GetMapping("/successMembershipMember")
	public String successMembershipMember(Model model,
									@RequestParam(value="pg_token", required = true) String pg_token) {
		de.debugging("successMembershipMember", "결제를 위한 토큰 token", pg_token);
		
		// 결제승인
		Map<String, Object> map = membershipMemberService.confirmKakoPay(pg_token);
		
		// 데이터 베이스에 결과 남기기
		membershipMemberService.addMembershipMember();

		// 결제정보 창으로 넘겨줌
		model.addAttribute("map", map);
		model.addAttribute("itemName", map.get("item_name"));
		model.addAttribute("amount", map.get("amount"));
		return "successMembershipMember";
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
