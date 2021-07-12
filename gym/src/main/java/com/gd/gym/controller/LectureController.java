package com.gd.gym.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LectureService;

@Controller
public class LectureController {
	@Autowired LectureService lecturService;
	@Autowired Debug de;
	
	// 강의실 목록조회
	@GetMapping("/branch/getLectureRoomList")
	public String getLectureRoomList(Model model) {
		List<Map<String, Object>> lectureRoomList = lecturService.getLectureRoomList();
		de.debugging("getLectureRoomList", "Controller lectureRoomList", lectureRoomList.toString());
		
		model.addAttribute("lectureRoomList", lectureRoomList);
		return "branch/getLectureRoomList";
	}
	
	// 강의실 삭제
	@GetMapping("/branch/removeLectureRoom")
	public String removeLectureRoom(int lectureRoomId) {
		int removeRow = lecturService.removeLectureRoom(lectureRoomId);
		de.debugging("removeLectureRoom", "Controller removeRow", removeRow);
		return "redirect:/branch/getLectureRoomList";
	}
	
	// 강의실 입력 폼
	@GetMapping("/branch/addLectureRoom")
	public String addLectureRoom() {
		return "branch/addLectureRoom";
	}
	// 강의실 입력 엑션
	@PostMapping("/branch/addLectureRoom")
	public String addLectureRoom(Model model,
			@RequestParam(value="permissionId", required = true) int permissionId,
			@RequestParam(value="lectureRoomName", required = true) String lectureRoomName,
			@RequestParam(value="lectureRoomCapacity", required = true) int lectureRoomCapacity) {
		de.debugging("addLectureRoom", "Controller permissionId", permissionId);
		de.debugging("addLectureRoom", "Controller lectureRoomName", lectureRoomName);
		de.debugging("addLectureRoom", "Controller lectureRoomCapacity", lectureRoomCapacity);
		
		Map<String, Object> map = new HashMap<>();
		map.put("permissionId", permissionId);
		map.put("lectureRoomName", lectureRoomName);
		map.put("lectureRoomCapacity", lectureRoomCapacity);
		
		lecturService.addLectureRoom(map);
		de.debugging("addLectureRoom", "Controller map", map.toString());
		return "redirect:/branch/getLectureRoomList";
	}
	
	// 강의실 수정 폼
	@GetMapping("/branch/modifyLectureRoom")
	public String modifyLectureRoom(Model model,
									@RequestParam(value="lectureRoomId", required = true) int lectureRoomId) {
		de.debugging("modifyLectureRoom", "Controller lectureRoomId", lectureRoomId);
		
		model.addAttribute("lectureRoomId", lectureRoomId);
		return "branch/modifyLectureRoom";
	}
	// 강의실 수정 엑션
	@PostMapping("/branch/modifyLectureRoom")
	public String modifyLectureRoom(Map<String, Object> map) {
		de.debugging("modifyLectureRoom", "Controller map", map.toString());
		
		lecturService.modifyLectureRoom(map);
		return "redirect:/branch/getLectureRoomList";
	}
}
