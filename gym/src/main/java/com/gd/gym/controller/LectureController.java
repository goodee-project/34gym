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
import com.gd.gym.vo.LectureRoom;

@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	@Autowired Debug de;
	
	// 강의실 목록조회
	@GetMapping("/branch/getLectureRoomList")
	public String getLectureRoomList(Model model) {
		List<LectureRoom> lectureRoomList = lectureService.getLectureRoomList();
		de.debugging("getLectureRoomList", "Controller lectureRoomList", lectureRoomList.toString());
		
		model.addAttribute("lectureRoomList", lectureRoomList);
		return "branch/getLectureRoomList";
	}
	
	// 강의실 삭제
	@GetMapping("/branch/removeLectureRoom")
	public String removeLectureRoom(int lectureRoomId) {
		de.debugging("removeLectureRoom", "Controller lectureRoomId", lectureRoomId);
		
		lectureService.removeLectureRoom(lectureRoomId);
		return "redirect:/branch/getLectureRoomList";
	}
	
	// 강의실 입력 폼
	@GetMapping("/branch/addLectureRoom")
	public String addLectureRoom() {
		return "branch/addLectureRoom";
	}
	
	// 강의실 입력 엑션
	@PostMapping("/branch/addLectureRoom")
	public String addLectureRoom(LectureRoom lectureRoom) {
		de.debugging("addLectureRoom", "Controller lectureRoom", lectureRoom.toString());
		
		lectureService.addLectureRoom(lectureRoom);
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
	public String modifyLectureRoom(LectureRoom lectureRoom) {
		de.debugging("modifyLectureRoom", "Controller lectureRoom", lectureRoom.toString());
		
		lectureService.modifyLectureRoom(lectureRoom);
		return "redirect:/branch/getLectureRoomList";
	}
}
