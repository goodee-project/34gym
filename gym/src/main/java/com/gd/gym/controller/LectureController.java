package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	// 강좌 상세보기 맵핑
	@GetMapping("/branch/getLectureOne")
	public String getLectureOne(Model model, HttpSession session, Lecture lecture) {
		// 매개변수 디버깅
		de.debugging("getLectureOne", "lecture", lecture.toString());
		
		// 매개변수 가공
		BranchMember loginBranch = (BranchMember)session.getAttribute("loginBranch");
		// lecture에 있는 permissionId를 세션에서 가져와서 넣어주기
		lecture.setPermissionId(loginBranch.getPermissionId());
		// 디버깅
		de.debugging("getLectureOne", "permissionId", lecture.getPermissionId());
		
		// 서비스 호출
		Map<String, Object> lectureOne = lectureService.getLectureOne(lecture);
		// 디버깅
		de.debugging("getLectureOne", "lectureOne", lectureOne.toString());
		
		model.addAttribute("lectureOne", lectureOne);
		
		return "branch/getLectureOne";
	}
	
	// 강좌 수정 폼
	@GetMapping("/branch/modifyLecture")
	public String modifyLecture(Model model, HttpSession session, Lecture lecture, @RequestParam(value="lectureId", required = true) int lectureId) {
		// 매개변수 디버깅
		de.debugging("modifyLecture", "lectureId", lectureId);
		
		// 매개변수 가공
		// 세션에서 지점ID 값을 가져옴
		BranchMember loginBranch = (BranchMember)session.getAttribute("loginBranch");
		int permissionId = loginBranch.getPermissionId();
		
		// lecture에 있는 permissionId를 세션에서 가져와서 넣어주기
		lecture.setPermissionId(permissionId);
		// lecture에 있는 lectureId 값 넣어주기
		lecture.setLectureId(lectureId);
		// 디버깅
		de.debugging("modifyLecture", "lecture", lecture.toString());
		
		// 수정 폼에서 사용할 선택한 강좌 정보 가져오기
		Map<String, Object> lectureOne = lectureService.getLectureOne(lecture);
		// 디버깅
		de.debugging("modifyLecture", "lectureOne", lectureOne.toString());
		
		model.addAttribute("lectureId", lectureId);
		model.addAttribute("permissionId", permissionId);
		model.addAttribute("lectureOne", lectureOne);
		
		return "branch/modifyLecture";
	}
	
	// 강좌 수정 액션
	@PostMapping("/branch/modifyLecture")
	public String modifyLecture(Lecture lecture) {
		// 매개변수 디버깅
		de.debugging("modifyLecture", "lecture", lecture.toString());
		
		// 매개변수 가공
		int lectureId = lecture.getLectureId();
		// 디버깅
		de.debugging("modifyLecture", "lectureId", lectureId);
		
		// 서비스 호출
		int modifyRow = lectureService.modifyLecture(lecture);
		// 디버깅
		de.debugging("modifyLecture", "modifyRow", modifyRow);
		
		return "redirect:/branch/getLectureOne?lectureId="+lectureId;
	}
	
	// 강좌 삭제 액션
	@GetMapping("/branch/removeLecture")
	public String removeLecture(@RequestParam(value="lectureId", required = true) int lectureId) {
		// 매개변수 디버깅
		de.debugging("removeLecture", "lectureId", lectureId);
		
		// 서비스 호출
		int removeRow = lectureService.removeLecture(lectureId);
		// 디버깅
		de.debugging("removeLecture", "removeRow", removeRow);
		
		return "redirect:/branch/getLectureList";
	}
}
