package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LectureService;
import com.gd.gym.vo.BranchMember;
import com.gd.gym.vo.Lecture;

@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	@Autowired Debug de;
	
	// 강좌 목록 맵핑
	@GetMapping("/branch/getLectureList")
	public String getLectureList(Model model, HttpSession session) {
		// 매개변수 가공
		BranchMember loginBranch = (BranchMember)session.getAttribute("loginBranch");
		// 디버깅
		de.debugging("getLectureList", "loginBranch", loginBranch.toString());
		
		int permissionId = loginBranch.getPermissionId();
		String branchName = loginBranch.getBranchName();
		// 디버깅
		de.debugging("getLectureList", "permissionId", permissionId);
		de.debugging("getLectureList", "branchName", branchName);
		
		
		// 서비스 호출
		List<Map<String, Object>> lectureList = lectureService.getLectureList(permissionId);
		// 결과물 디버깅
		de.debugging("getLectureList", "lectureList", lectureList.toString());
		
		model.addAttribute("lectureList", lectureList);
		model.addAttribute("permissionId", permissionId);
		model.addAttribute("branchName", branchName);
		
		return "branch/getLectureList";
	}
	
	// 강좌 개설 폼
	@GetMapping("/branch/addLecture")
	public String addLecture(Model model, HttpSession session) {
		// 매개변수 가공
		BranchMember loginBranch = (BranchMember)session.getAttribute("loginBranch");
		// 디버깅
		de.debugging("addLecture", "loginBranch", loginBranch.toString());
		
		int permissionId = loginBranch.getPermissionId();
		String branchName = loginBranch.getBranchName();
		// 디버깅
		de.debugging("getLectureList", "permissionId", permissionId);
		de.debugging("getLectureList", "branchName", branchName);
		
		model.addAttribute("permissionId", permissionId);
		model.addAttribute("branchName", branchName);
		
		return "branch/addLecture";
	}
	
	// 강좌 개설 액션
	@PostMapping("/branch/addLecture")
	public String addLecture(Lecture lecture) {
		// 매개변수 디버깅
		de.debugging("addLecture", "lecture", lecture.toString());
		
		// 서비스 호출
		int addRow = lectureService.addLecture(lecture);
		// 디버깅
		de.debugging("addLecture", "addRow", addRow);
		
		return "redirect:/branch/getLectureList";
	}
}
