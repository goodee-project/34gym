package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LectureMemberInbodyService;
import com.gd.gym.vo.Member;
import com.gd.gym.vo.LectureMemberInbody;

@Controller
public class LectureMemberInbodyController {
	@Autowired LectureMemberInbodyService lectureMemberInbodyService;
	@Autowired Debug de;

	// 강좌 회원 인바디 입력 폼
	@GetMapping("/trainer/addLectureMemberInbody")
	public String addLectureMemberInbody() {
		return "trainer/addLectureMemberInbody";
	}
	
	// 강좌 회원 인바디 입력 엑션
	@PostMapping("/trainer/addLectureMemberInbody")
	public String addLectureMemberInbody(LectureMemberInbody lectureMemberInbody) {
		de.debugging("addLectureMemberInbody", "Controller LectureMemberInbody", lectureMemberInbody.toString());
		
		lectureMemberInbodyService.addLectureMemberInbody(lectureMemberInbody);
		return "redirect:/member/getMemberMyPage";
	}
	
	// 강좌 회원 인바디 목록
	@GetMapping("/member/getLectureMemberInbodyList")
	public String getLectureMemberInbodyList(HttpSession session, Model model) {
		int memberId = 0;
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 로그인정보 담겨있으면 memberId 가공
		if(loginMember != null) {
			memberId = loginMember.getMemberId();
		}
				
		List<Map<String, Object>> lectureMemberInbodyList = lectureMemberInbodyService.getLectureMemberInbodyList(memberId);
		de.debugging("getLectureMemberInbodyList", "Controller lectureMemberInbodyList", lectureMemberInbodyList.toString());
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("lectureMemberInbodyList", lectureMemberInbodyList);
		return "member/getLectureMemberInbodyList";
	}
	
	// 운동이용권 회원 인바디 상세보기
	@GetMapping("/member/getLectureMemberInbodyOne")
	public String getLectureMemberInbodyOne(Model model,
			@RequestParam(value="lectureMemberInbodyId", required = true) Integer lectureMemberInbodyId) {
				
		Map<String, Object> lectureMemberInbody = lectureMemberInbodyService.getLectureMemberInbodyOne(lectureMemberInbodyId);
		de.debugging("getLectureMemberInbodyList", "Controller lectureMemberInbody", lectureMemberInbody.toString());
		
		model.addAttribute("lectureMemberInbodyId", lectureMemberInbodyId);
		model.addAttribute("lectureMemberInbody", lectureMemberInbody);
		return "member/getLectureMemberInbodyOne";
	}
}
