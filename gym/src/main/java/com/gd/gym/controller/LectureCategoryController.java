package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LectureCategoryService;
import com.gd.gym.vo.LectureCategory;

@Controller
public class LectureCategoryController {
	@Autowired Debug de;
	@Autowired LectureCategoryService lectureCategoryService;
	
	// 지점 계약조건 목록조회
		@GetMapping("/getLectureCategoryList")
		public String getLectureCategoryList(Model model) {
			List<LectureCategory> lectureCategoryList = lectureCategoryService.getLectureCategoryList();
			de.debugging("getLectureCategoryList", "Controller lectureCategoryList", lectureCategoryList.toString());
			
			model.addAttribute("lectureCategoryList", lectureCategoryList);
			return "getLectureCategoryList";
		}
		
		// 지점 계약조건 삭제
		@GetMapping("/removeLectureCategory")
		public String removeLectureCategory(int lectureCategoryId) {
			int removeRow = lectureCategoryService.removeLectureCategory(lectureCategoryId);
			de.debugging("removeLectureCategory", "Controller removeRow", removeRow);
			return "redirect:/getLectureCategoryList";
		}
		
		// 지점 계약조건 입력 폼
		@GetMapping("/addLectureCategory")
		public String addLectureCategory() {
			return "addLectureCategory";
		}
		// 지점 계약조건 입력 엑션
		@PostMapping("/addLectureCategory")
		public String addlectureCategory(LectureCategory lectureCategory) {
			lectureCategoryService.addLectureCategory(lectureCategory);
			de.debugging("addLectureCategory", "Controller lectureCategory", lectureCategory.toString());
			return "redirect:/getLectureCategoryList";
		}
		
		// 지점 계약조건 수정 폼
		@GetMapping("/modifyLectureCategory")
		public String modifyLectureCategory(Model model,
										@RequestParam(value="lectureCategoryId", required = true) int lectureCategoryId) {
			LectureCategory lectureCategoryOne = lectureCategoryService.getLectureCategoryOne(lectureCategoryId);
			de.debugging("modifyLectureCategory", "Controller lectureCategoryOne", lectureCategoryOne.toString());
			
			model.addAttribute("lectureCategoryOne", lectureCategoryOne);
			return "modifyLectureCategory";
		}
		// 지점 계약조건 수정 엑션
		@PostMapping("/modifyLectureCategory")
		public String modifyLectureCategory(LectureCategory lectureCategory) {
			de.debugging("modifylectureCategory", "Controller lectureCategory", lectureCategory.toString());
			lectureCategoryService.modifyLectureCategory(lectureCategory);
			return "redirect:/getLectureCategoryList";
		}
}
