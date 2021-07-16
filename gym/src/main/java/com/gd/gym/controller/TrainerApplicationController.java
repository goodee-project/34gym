package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.TrainerApplicationService;
import com.gd.gym.service.TrainerRecruitmentService;
import com.gd.gym.vo.BranchMember;

@Controller
public class TrainerApplicationController {
	@Autowired TrainerApplicationService trainerApplicationService;
	@Autowired TrainerRecruitmentService trainerRecruitmentService;
	@Autowired Debug de;
	
	// 강사지원 목록
	@GetMapping("/branch/getTrainerApplicationList")
	public String getTrainerApplicationList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.getAttribute("loginBranch");
		
		int permissionId = ((BranchMember)(session.getAttribute("loginBranch"))).getPermissionId();
		de.debugging("getTrainerApplicationList", "Controller permissionId", permissionId);
		
		List<Map<String, Object>> trainerApplicationList = trainerApplicationService.getTrainerApplicationList(permissionId);
		de.debugging("getTrainerApplicationList", "Controller trainerApplicationList", trainerApplicationList.toString());
		
		model.addAttribute("permissionId", permissionId);
		model.addAttribute("trainerApplicationList", trainerApplicationList);
		return "branch/getTrainerApplicationList";
	}
	
	// 강사지원 상세보기
	@GetMapping("/branch/getTrainerApplicationOne")
	public String getTrainerApplicationOne(Model model,
			@RequestParam(value="trainerApplicationId", required = true) Integer trainerApplicationId,
			@RequestParam(value="permissionId", required = true) Integer permissionId) {
		de.debugging("getTrainerApplicationOne", "Controller trainerApplicationId", trainerApplicationId);
		de.debugging("getTrainerApplicationOne", "Controller permissionId", permissionId);
		
		Map<String, Object> trainerApplicationOne = trainerApplicationService.getTrainerApplicationOne(trainerApplicationId);
		de.debugging("getTrainerApplicationOne", "Controller trainerApplicationOne", trainerApplicationOne.toString());
		
		Map<String, Object> trainerApplicationIdForRecruitment = trainerRecruitmentService.getTrainerApplicationIdForRecruitment(trainerApplicationId);
	
		
		model.addAttribute("permissionId", permissionId);
		model.addAttribute("trainerApplicationOne", trainerApplicationOne);
		model.addAttribute("trainerApplicationIdForRecruitment", trainerApplicationIdForRecruitment);
		return "branch/getTrainerApplicationOne";
	}
}
