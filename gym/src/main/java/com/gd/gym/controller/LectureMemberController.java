package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.BranchService;
import com.gd.gym.service.LectureMemberService;
import com.gd.gym.vo.Branch;

@Controller
public class LectureMemberController {
	@Autowired Debug de;
	@Autowired BranchService branchService;
	@Autowired LectureMemberService lectureMemberService;

	@GetMapping("/getClassTimetable")
	public String getClassTimetable(Model model,
									@RequestParam(value="permissionId", defaultValue = "1") int permissionId) {
		
		// 개설강좌 가져오기
		List<Map<String, Object>> lectureTimetableList = lectureMemberService.getLectureTimetable(permissionId);
		// 지점목록 가져오기
		List<Branch> branchList = branchService.getBranchNameList();
		de.debugging("getClassTimetable", "Controller branchList", branchList.toString());

		model.addAttribute("lectureTimetableList", lectureTimetableList);
		model.addAttribute("branchList", branchList);
		return "getClassTimetable";
	}

	// 개설강좌 상세보기
	@GetMapping("/getClassTimetableOne")
	public String getClassTimetableOne(Model model, 
										@RequestParam(value="lectureId", required = true) int lectureId) {
		Map<String, Object> classTimetableOne = lectureMemberService.getLectureTimetableOne(lectureId);
		
		model.addAttribute("classTimetableOne", classTimetableOne);
		return "/getClassTimetableOne";
	}
}
