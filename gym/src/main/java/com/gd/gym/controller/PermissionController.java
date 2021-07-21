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
	public String addPermission() {
		return "redirect:/member/getPermissionList";
	}
	
	@GetMapping("/removePermission")
	public String removePermission(@RequestParam(value="permissionId", required = true) int permissionId) {
		
		// permissionId 디버깅
		debug.debugging("removePermission", "permissionId", permissionId);
		
		// 서비스 호출
		permissionService.removePermission(permissionId);
		
		return "redirect:/member/getPermissionList";
	}
}
