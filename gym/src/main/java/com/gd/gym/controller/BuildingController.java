package com.gd.gym.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.BuildingService;
import com.gd.gym.vo.Building;
import com.gd.gym.vo.Member;

@Controller
public class BuildingController {
	
	@Autowired private BuildingService buildingService;
	@Autowired private Debug debug;
	
	// 빌딩 리스트 맵핑
	@GetMapping("/member/getBuildingList")
	public String getBuildingList(HttpServletRequest request, Model model) {
		
		// 세션 가져오기
		HttpSession session = request.getSession();
		
		int memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		String memberName = ((Member)session.getAttribute("loginMember")).getMemberName();
		
		// memberId debug
		debug.debugging("getBuildingList", "memberId", memberId);
		
		// 서비스 호출
		List<Building> buildingList = buildingService.getBuildingList(memberId);
		debug.debugging("getBuildingList", "buildingList", buildingList.toString());
		
		// model(buildingList에 넘기기 위해 모델 사용)
		model.addAttribute("buildingList",buildingList);
		model.addAttribute("memberId",memberId);
		model.addAttribute("memberName",memberName);
		
		return "member/getBuildingList";
	}
	
	// 빌딩 등록 폼 맵핑
	@GetMapping("/member/addBuildingForm")
	public String addbuilding(Model model, @RequestParam(value="memberId", required = true) int memberId,
											@RequestParam(value="memberName", required = true) String memberName) {
		
		// memberId debug
		debug.debugging("addBuildingForm", "memberId", memberId);
		debug.debugging("addBuildingForm", "memberName", memberName);
		
		// model(addBuildingForm에 넘기기 위해 모델 사용)
		model.addAttribute("memberId",memberId);
		model.addAttribute("memberName",memberName);
		
		return "member/addBuildingForm";
	}
	
	// 빌딩 추가 맵핑
	@PostMapping("/addBuilding")
	public String addbuilding(@RequestParam(value="buildingAddress", required = true) String buildingAddress,
			@RequestParam(value="buildingDetailAddress", required = true) String buildingDetailAddress,
			@RequestParam(value="buildingExtraAddress", required = true) String buildingExtraAddress,
			@RequestParam(value="postCode", required = true) String postCode,
			@RequestParam(value="memberId", required = true) Integer memberId) {
		
		// RequestParam 디버깅
		debug.debugging("addBuilding", "buildingAddress", buildingAddress);
		debug.debugging("addBuilding", "buildingDetailAddress", buildingDetailAddress);
		debug.debugging("addBuilding", "buildingExtraAddress", buildingExtraAddress);
		debug.debugging("addBuilding", "postCode", postCode);
		
		buildingAddress = buildingAddress + "(" + postCode + ")";
		String buildingDetail = buildingExtraAddress + " " + buildingDetailAddress;
		
		Building building = new Building();
		building.setBuildingAddress(buildingAddress);
		building.setBuildingDetail(buildingDetail);
		building.setMemberId(memberId);
		
		// 서비스 호출
		int addRow = buildingService.addBuilding(building);
		debug.debugging("addBuilding", "addRow", addRow);
		
		return "redirect:/member/getBuildingList";
	}
	
	// 빌딩 등록 취소 맵핑
	@GetMapping("/removeBuilding")
	public String removeBuilding(@RequestParam(value="buildingId", required = true) int buildingId) {
		// RequestParam 디버깅
		debug.debugging("removeBuilding", "buildingId", buildingId);
		
		// 서비스 호출
		int removeRow = buildingService.removeBuilding(buildingId);
		debug.debugging("removeBuilding", "removeRow", removeRow);
		
		return "redirect:/member/getBuildingList";
	}
}
