package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LectureService;

@Controller
public class LectureController {
	@Autowired LectureService lectureService;
	@Autowired Debug de;
	
	// 강좌 목록 맵핑
	@GetMapping("/branch/getLectureList")
	public String getLectureList(Model model) {
		// 서비스 호출
		List<Map<String, Object>> lectureList = lectureService.getLectureList();
		// 결과물 디버깅
		de.debugging("getLectureList", "lectureList", lectureList.toString());
		
		model.addAttribute("lectureList", lectureList);
		
		return "branch/getLectureList";
	}
}
