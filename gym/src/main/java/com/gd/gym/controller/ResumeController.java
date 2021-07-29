package com.gd.gym.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.ResumeService;
import com.gd.gym.vo.Member;
import com.gd.gym.vo.Resume;

@Controller
public class ResumeController {
	@Autowired ResumeService resumeService;
	@Autowired Debug de;
	
	// 이력서 입력 폼
	@GetMapping("/member/addResume")
	public String addResume(HttpSession session, Model model) {
		int memberId = 0;
		Member loginMember = (Member)session.getAttribute("loginMember");
		de.debugging("addResume", "Controller loginMember", loginMember.toString());
		
		// 로그인정보 담겨있으면 memberId 가공
		if(loginMember != null) {
			memberId = loginMember.getMemberId();
		}
		
		model.addAttribute("memberId", memberId);
		return "member/addResume";
	}
	
	// 이력서 입력 엑션
	@PostMapping("/member/addResume")
	public String addResume(Resume resume) {
		
		resumeService.addResume(resume);
		return "redirect:/member/getResumeList";
	}
}
