package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.BranchService;
import com.gd.gym.service.LectureRoomService;
import com.gd.gym.service.PermissionService;
import com.gd.gym.vo.Branch;
import com.gd.gym.vo.LectureRoom;
import com.gd.gym.vo.Permission;

@Controller
public class LectureRoomController {
	@Autowired LectureRoomService lectureRoomService;
	@Autowired BranchService branchService;
	@Autowired Debug de;
	
	// 강의실 목록조회
	@GetMapping("/branch/getLectureRoomList")
	public String getLectureRoomList(Model model) {
		List<LectureRoom> lectureRoomList = lectureRoomService.getLectureRoomList();
		de.debugging("getLectureRoomList", "Controller lectureRoomList", lectureRoomList.toString());
		
		model.addAttribute("lectureRoomList", lectureRoomList);
		return "branch/getLectureRoomList";
	}
	
	// 강의실 삭제
	@GetMapping("/branch/removeLectureRoom")
	public String removeLectureRoom(int lectureRoomId) {
		de.debugging("removeLectureRoom", "Controller lectureRoomId", lectureRoomId);
		
		lectureRoomService.removeLectureRoom(lectureRoomId);
		return "redirect:/branch/getLectureRoomList";
	}
	
	// 강의실 입력 폼
	@GetMapping("/branch/addLectureRoom")
	public String addLectureRoom(Model model) {
		List<Branch> branchNameList = branchService.getBranchList();
		de.debugging("addLectureRoom", "Controller branchNameList", branchNameList.toString());
		
		model.addAttribute("branchNameList", branchNameList);
		return "branch/addLectureRoom";
	}
	
	// 강의실 입력 엑션
	@PostMapping("/branch/addLectureRoom")
	public String addLectureRoom(LectureRoom lectureRoom) {
		de.debugging("addLectureRoom", "Controller lectureRoom", lectureRoom.toString());
		
		lectureRoomService.addLectureRoom(lectureRoom);
		return "redirect:/branch/getLectureRoomList";
	}
	
	// 강의실 수정 폼
	@GetMapping("/branch/modifyLectureRoom")
	public String modifyLectureRoom(Model model,
									@RequestParam(value="lectureRoomId", required = true) int lectureRoomId) {
		de.debugging("modifyLectureRoom", "Controller lectureRoomId", lectureRoomId);
		
		List<Branch> branchNameList = branchService.getBranchList();
		de.debugging("addLectureRoom", "Controller branchNameList", branchNameList.toString());
		
		model.addAttribute("lectureRoomId", lectureRoomId);
		model.addAttribute("branchNameList", branchNameList);
		return "branch/modifyLectureRoom";
	}
	
	// 강의실 수정 엑션
	@PostMapping("/branch/modifyLectureRoom")
	public String modifyLectureRoom(LectureRoom lectureRoom) {
		de.debugging("modifyLectureRoom", "Controller lectureRoom", lectureRoom.toString());
		
		lectureRoomService.modifyLectureRoom(lectureRoom);
		return "redirect:/branch/getLectureRoomList";
	}
}
