package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.TrainerService;
import com.gd.gym.vo.TrainerRecruitment;

@Controller
public class TrainerController {
	@Autowired TrainerService trainerService;
	@Autowired Debug de;
	
	// 강의실 목록조회
	@GetMapping("/branch/getTrainerRecruitmentList")
	public String getTrainerRecruitmentList(Model model) {
		List<TrainerRecruitment> trainerRecruitmentList = trainerService.getTrainerRecruitmentList();
		de.debugging("getTrainerRecruitmentList", "Controller trainerRecruitmentList", trainerRecruitmentList.toString());
		
		model.addAttribute("trainerRecruitmentList", trainerRecruitmentList);
		return "branch/getTrainerRecruitmentList";
	}
	
	// 강의실 수정 폼
	@GetMapping("/branch/modifyTrainerRecruitment")
	public String modifyTrainerRecruitment(Model model,
									@RequestParam(value="trainerApplicationId", required = true) int trainerApplicationId) {
		de.debugging("modifyTrainerRecruitment", "Controller trainerApplicationId", trainerApplicationId);
		
		model.addAttribute("trainerApplicationId", trainerApplicationId);
		return "branch/modifyTrainerRecruitment";
	}
	
	// 강의실 수정 엑션
	@PostMapping("/branch/modifyTrainerRecruitment")
	public String modifyTrainerRecruitment(TrainerRecruitment trainerRecruitment) {
		de.debugging("modifyTrainerRecruitment", "Controller trainerRecruitment", trainerRecruitment.toString());
		
		int row = trainerService.modifyTrainerRecruitment(trainerRecruitment);
		de.debugging("modifyTrainerRecruitment", "Controller row", row);
		return "redirect:/branch/getTrainerRecruitmentList";
	}
		
	// 강의실 삭제
	@GetMapping("/branch/removeTrainerRecruitment")
	public String removeTrainerRecruitment(int trainerApplicationId) {
		de.debugging("removeTrainerRecruitment", "Controller trainerApplicationId", trainerApplicationId);
		
		int row = trainerService.removeTrainerRecruitment(trainerApplicationId);
		de.debugging("removeTrainerRecruitment", "Controller row", row);
		return "redirect:/branch/getTrainerRecruitmentList";
	}

}
