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
import com.gd.gym.service.ResumeService;
import com.gd.gym.vo.BranchMember;
import com.gd.gym.vo.Member;
import com.gd.gym.vo.Resume;
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
		return "redirect:/member/getResumeListById";
	}
	
	// 회원 이력서 목록
	@GetMapping("/member/getResumeListById")
	public String getResumeListById(HttpSession session, Model model) {
		int memberId = 0;
		Member loginMember = (Member)session.getAttribute("loginMember");
		de.debugging("getResumeListById", "Controller loginMember", loginMember.toString());
		
		// 로그인정보 담겨있으면 memberId 가공
		if(loginMember != null) {
			memberId = loginMember.getMemberId();
		}
		
		List<Map<String, Object>> resumeList = resumeService.getResumeListById(memberId);
		de.debugging("getResumeListById", "Controller resumeList", resumeList.toString());
		
		model.addAttribute("resumeList", resumeList);
		model.addAttribute("memberId", memberId);
		return "member/getResumeListById";
	}
	
	// 이력서 수정 폼
	@GetMapping("/member/modifyResume")
	public String modifyResume() {
		return "member/modifyResume";
	}
	
	// 이력서 수정 엑션
	@PostMapping("/member/modifyResume")
	public String modifyResume(Resume resume) {
		de.debugging("modifyResume", "Controller resume", resume.toString());
		
		int row = resumeService.modifyResume(resume);
		de.debugging("modifyResume", "Controller row", row);
		return "redirect:/member/getResumeListById";
	}
	
	// 이력서 삭제
	@GetMapping("/branch/removeResume")
	public String removeResume(int resumeId) {
		de.debugging("removeResume", "Controller resumeId", resumeId);
		
		int row = resumeService.removeResume(resumeId);
		de.debugging("removeResume", "Controller row", row);
		return "redirect:/member/getResumeListById";
	}
	
	// 이력서 상세보기
	@GetMapping("/member/getResumeOne")
	public String getResumeOne(Model model,
			@RequestParam(value="resumeId", required = true) Integer resumeId) {
		de.debugging("getResumeOne", "Controller resumeId", resumeId);
		
		Map<String, Object> resumeMap = resumeService.getResumeOne(resumeId);
		de.debugging("getResumeOne", "Controller resumeMap", resumeMap.toString());
		
		model.addAttribute("resumeMap", resumeMap);
		return "member/getResumeOne";
	}
}
