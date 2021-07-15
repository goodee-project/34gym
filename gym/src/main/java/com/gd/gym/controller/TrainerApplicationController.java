package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.TrainerApplicationService;

@Controller
public class TrainerApplicationController {
	@Autowired TrainerApplicationService trainerApplicationService;
	@Autowired Debug de;
	
	// 강사지원 목록
	@GetMapping("/branch/getTrainerApplicationList")
	public String getTrainerApplicationList(Model model) {
		List<Map<String, Object>> trainerApplicationList = trainerApplicationService.getTrainerApplicationList();
		de.debugging("getTrainerApplicationList", "Controller trainerApplicationList", trainerApplicationList.toString());
		
		model.addAttribute("trainerApplicationList", trainerApplicationList);
		return "branch/getTrainerApplicationList";
	}
	
	// 강사지원 상세보기
	@GetMapping("/branch/getTrainerApplicationOne")
	public String getTrainerApplicationOne(Model model,
			@RequestParam(value="trainerApplicationId", required = true) Integer trainerApplicationId) {
		de.debugging("getTrainerApplicationOne", "Controller trainerApplicationId", trainerApplicationId);
		
		Map<String, Object> trainerApplicationOne = trainerApplicationService.getTrainerApplicationOne(trainerApplicationId);
		de.debugging("getTrainerApplicationOne", "Controller trainerApplicationOne", trainerApplicationOne.toString());
		
		model.addAttribute("trainerApplicationOne", trainerApplicationOne);
		return "branch/getTrainerApplicationOne";
	}
}
