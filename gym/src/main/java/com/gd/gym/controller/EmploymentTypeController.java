package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.EmploymentTypeService;
import com.gd.gym.vo.EmploymentType;

@Controller
public class EmploymentTypeController {
	@Autowired Debug de;
	@Autowired EmploymentTypeService employmentTypeService;
	
	// 고용형태(카테고리) 목록조회
	@GetMapping("/getEmploymentTypeList")
	public String getEmploymentTypeList(Model model) {
		List<EmploymentType> employmentTypeList = employmentTypeService.getEmploymentTypeList();
		de.debugging("getEmploymentTypeList", "Controller EmploymentTypeList", employmentTypeList.toString());
		
		model.addAttribute("employmentTypeList", employmentTypeList);
		return "getEmploymentTypeList";
	}
	
	// 고용형태(카테고리) 삭제
	@GetMapping("/removeEmploymentType")
	public String removeEmploymentType(int employmentTypeId) {
		int removeRow = employmentTypeService.removeEmploymentType(employmentTypeId);
		de.debugging("removeEmploymentType", "Controller removeRow", removeRow);
		return "redirect:/getEmploymentTypeList";
	}
	
	// 고용형태(카테고리) 입력 폼
	@GetMapping("/addEmploymentType")
	public String addEmploymentType() {
		return "addEmploymentType";
	}
	// 고용형태(카테고리) 입력 엑션
	@PostMapping("/addEmploymentType")
	public String addEmploymentType(EmploymentType employmentType) {
		employmentTypeService.addEmploymentType(employmentType);
		de.debugging("addEmploymentType", "Controller EmploymentType", employmentType.toString());
		return "redirect:/getEmploymentTypeList";
	}
	
	// 고용형태(카테고리) 수정 폼
	@GetMapping("/modifyEmploymentType")
	public String modifyEmploymentType(Model model,
									@RequestParam(value="employmentTypeId", required = true) int employmentTypeId) {
		EmploymentType employmentTypeOne = employmentTypeService.getEmploymentTypeOne(employmentTypeId);
		de.debugging("modifyEmploymentType", "Controller EmploymentTypeOne", employmentTypeOne.toString());
		
		model.addAttribute("employmentTypeOne", employmentTypeOne);
		return "modifyEmploymentType";
	}
	// 고용형태(카테고리) 수정 엑션
	@PostMapping("/modifyEmploymentType")
	public String modifyEmploymentType(EmploymentType employmentType) {
		de.debugging("modifyEmploymentType", "Controller EmploymentType", employmentType.toString());
		employmentTypeService.modifyEmploymentType(employmentType);
		return "redirect:/getEmploymentTypeList";
	}
}
