package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.TrainerRecruitmentService;
import com.gd.gym.vo.TrainerRecruitment;

@Controller
public class TrainerRecruitmentController {
	@Autowired TrainerRecruitmentService trainerRecruitmentService;
	@Autowired Debug de;
	
	// 강사 목록조회
	@GetMapping("/branch/getTrainerRecruitmentList")
	public String getTrainerRecruitmentList(Model model) {
		List<Map<String, Object>> trainerRecruitmentList = trainerRecruitmentService.getTrainerRecruitmentList();
		de.debugging("getTrainerRecruitmentList", "Controller trainerRecruitmentList", trainerRecruitmentList.toString());
		
		model.addAttribute("trainerRecruitmentList", trainerRecruitmentList);
		return "branch/getTrainerRecruitmentList";
	}
	
	// 강사 수정 폼
	@GetMapping("/branch/modifyTrainerRecruitment")
	public String modifyTrainerRecruitment(Model model,
									@RequestParam(value="trainerApplicationId", required = true) int trainerApplicationId) {
		de.debugging("modifyTrainerRecruitment", "Controller trainerApplicationId", trainerApplicationId);
		
		Map<String, Object> map = trainerRecruitmentService.getTrainerRecruitmentById(trainerApplicationId);
		
		model.addAttribute("trainerApplicationId", trainerApplicationId);
		model.addAttribute("map", map);
		return "branch/modifyTrainerRecruitment";
	}
	
	// 강사 수정 엑션
	@PostMapping("/branch/modifyTrainerRecruitment")
	public String modifyTrainerRecruitment(TrainerRecruitment trainerRecruitment) {
		de.debugging("modifyTrainerRecruitment", "Controller trainerRecruitment", trainerRecruitment.toString());
		
		int row = trainerRecruitmentService.modifyTrainerRecruitment(trainerRecruitment);
		de.debugging("modifyTrainerRecruitment", "Controller row", row);
		return "redirect:/branch/getTrainerRecruitmentList";
	}
		
	// 강사 삭제
	@GetMapping("/branch/removeTrainerRecruitment")
	public String removeTrainerRecruitment(int trainerApplicationId) {
		de.debugging("removeTrainerRecruitment", "Controller trainerApplicationId", trainerApplicationId);
		
		int row = trainerRecruitmentService.removeTrainerRecruitment(trainerApplicationId);
		de.debugging("removeTrainerRecruitment", "Controller row", row);
		return "redirect:/branch/getTrainerRecruitmentList";
	}
	
	// 강사 목록조회
	@GetMapping("/branch/getTrainerRecruitmentOne")
	public String getTrainerRecruitmentOne(Model model,
			@RequestParam(value="trainerApplicationId", required = true) Integer trainerApplicationId) {
		de.debugging("getTrainerRecruitmentOne", "Controller trainerApplicationId", trainerApplicationId);
		
		Map<String, Object> trainerRecruitmentMap = trainerRecruitmentService.getTrainerRecruitmentOne(trainerApplicationId);
		de.debugging("getTrainerRecruitmentOne", "Controller trainerRecruitmentMap", trainerRecruitmentMap.toString());
		
		model.addAttribute("trainerRecruitmentMap", trainerRecruitmentMap);
		return "branch/getTrainerRecruitmentOne";
	}

}
