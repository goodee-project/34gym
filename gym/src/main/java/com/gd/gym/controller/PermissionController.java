package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.PermissionService;
import com.gd.gym.vo.Member;
import com.gd.gym.vo.Permission;

@Controller
public class PermissionController {
	
	@Autowired private PermissionService permissionService;
	@Autowired private Debug debug;
	
	// Permission(지점신청) 리스트
	@GetMapping("/member/getPermissionList")
	public String getPermissionList(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		
		int memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		// 서비스 호출
		List<Permission> permissionList = permissionService.getPermissionList(memberId);
		debug.debugging("getPermissionList", "memberId", memberId);
		
		
		// model
		model.addAttribute("permissionList", permissionList);
		model.addAttribute("memberId", memberId);
		return "member/getPermissionList";
	}
	
	// Permission 추가
	@GetMapping("/member/addPermissionForm")
	public String addPermissionForm(Model model, @RequestParam(value="memberId", required = true) int memberId) {
		
		// memberId 디버깅
		debug.debugging("addPermissionForm", "memberId", memberId);
		
		// model
		model.addAttribute("memberId", memberId);
		
		return "member/addPermissionForm";
	}
	
	@PostMapping("/addPermission")
	public String addPermission(HttpServletRequest request, @RequestParam(value="buildingId", required = true) int buildingId,
								@RequestParam(value="contractId", required = true) int contractid,
								@RequestParam(value="description", required = true) String description) {
		// 세션가져오기
		HttpSession session = request.getSession();
		int memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
		
		// 파라미터 디버깅
		debug.debugging("addPermission", "buildingId", buildingId);
		debug.debugging("addPermission", "contractid", contractid);				
		debug.debugging("addPermission", "description", description);
		
		Permission permission = new Permission();
		permission.setBuildingId(buildingId);
		permission.setContractId(contractid);
		permission.setDescription(description);
		permission.setMemberId(memberId);
		
		// 서비스 호출
		int addRow = permissionService.addPermission(permission);
		debug.debugging("addPermission", "addRow", addRow);
		
		return "redirect:/member/getPermissionList";
	}
	
	@GetMapping("/removePermission")
	public String removePermission(@RequestParam(value="permissionId", required = true) int permissionId) {
		
		// permissionId 디버깅
		debug.debugging("removePermission", "permissionId", permissionId);
		
		// 서비스 호출
		int removeRow = permissionService.removePermission(permissionId);
		debug.debugging("removePermission", "removeRow", removeRow);
		
		return "redirect:/member/getPermissionList";
	}
	
	// 관리자 지점신청 부분
	// 지점신청 대기 목록(조회)
	@GetMapping("/admin/getWaitingForPermissionList")
	public String getWatingForPermissionList(Model model) {
		// 서비스 호출
		List<Map<String, Object>> permissionList = permissionService.getWaitingForPermissionList();
		debug.debugging("getWatingForPermissionList", "permissionList", permissionList.toString());
		
		model.addAttribute("permissionList", permissionList);
		
		return "admin/getWaitingForPermissionList";
	}
	
	// 지점신청 대기 상세보기
	@GetMapping("/admin/getWaitingForPermissionOne")
	public String getWaitingForPermissionOne(Model model, @RequestParam(value="permissionId", required = true) int permissionId) {
		// 매개변수 디버깅
		debug.debugging("getWaitingForPermissionOne", "permissionId", permissionId);
		
		// 서비스 호출
		Map<String, Object> permissionOne = permissionService.getWaitingForPermissionOne(permissionId);
		debug.debugging("getWaitingForPermissionOne", "permissionOne", permissionOne.toString());
		
		model.addAttribute("permissionOne", permissionOne);
		
		return "admin/getWaitingForPermissionOne";
	}
}
