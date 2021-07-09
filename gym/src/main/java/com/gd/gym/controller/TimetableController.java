package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.TimetableService;
import com.gd.gym.vo.Timetable;

@Controller
public class TimetableController {
	@Autowired Debug de;
	@Autowired TimetableService timetableService;
	
	// 고용형태(카테고리) 목록조회
	@GetMapping("/admin/getTimetableList")
	public String getTimetableList(Model model) {
		List<Timetable> timetableList = timetableService.getTimetableList();
		de.debugging("getTimetableList", "Controller timetableList", timetableList.toString());
		
		model.addAttribute("timetableList", timetableList);
		return "admin/getTimetableList";
	}
	
	// 고용형태(카테고리) 삭제
	@GetMapping("/admin/removeTimetable")
	public String removeTimetable(int timetableId) {
		int removeRow = timetableService.removeTimetable(timetableId);
		de.debugging("removeTimetable", "Controller removeRow", removeRow);
		return "redirect:/admin/getTimetableList";
	}
	
	// 고용형태(카테고리) 입력 폼
	@GetMapping("/admin/addTimetable")
	public String addTimetable() {
		return "admin/addTimetable";
	}
	// 고용형태(카테고리) 입력 엑션
	@PostMapping("/admin/addTimetable")
	public String addTimetable(Timetable timetable) {
		timetableService.addTimetable(timetable);
		de.debugging("addTimetable", "Controller timetable", timetable.toString());
		return "redirect:/admin/getTimetableList";
	}
	
	// 고용형태(카테고리) 수정 폼
	@GetMapping("/admin/modifyTimetable")
	public String modifyTimetable(Model model,
									@RequestParam(value="timetableId", required = true) int timetableId) {
		Timetable timetableOne = timetableService.getTimetableOne(timetableId);
		de.debugging("modifyTimetable", "Controller TimetableOne", timetableOne.toString());
		
		model.addAttribute("timetableOne", timetableOne);
		return "admin/modifyTimetable";
	}
	// 고용형태(카테고리) 수정 엑션
	@PostMapping("/admin/modifyTimetable")
	public String modifyTimetable(Timetable timetable) {
		de.debugging("modifyTimetable", "Controller Timetable", timetable.toString());
		timetableService.modifyTimetable(timetable);
		return "redirect:/admin/getTimetableList";
	}	
}
