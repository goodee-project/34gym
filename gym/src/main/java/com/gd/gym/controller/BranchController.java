package com.gd.gym.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.BranchService;
import com.gd.gym.vo.Admin;
import com.gd.gym.vo.Branch;

@Controller
public class BranchController {
	@Autowired Debug debug;
	@Autowired BranchService branchService;
	
	// 지점 허가 폼
	@GetMapping("/admin/addBranch")
	public String addBranch(Model model, @RequestParam(value="permissionId", required=true) int permissionId) {
		// 매개변수 디버깅
		debug.debugging("addBranch", "permissionId", permissionId);
		
		model.addAttribute("permissionId", permissionId);
		
		return "admin/addBranch";
	}
	
	// 지점 허가 액션
	@PostMapping("/admin/addBranch")
	public String addBranch(HttpSession session, Branch branch) {
		// 매개변수 디버깅
		debug.debugging("addBranch", "branch", branch.toString());
		
		// 매개변수 가공
		Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
		branch.setAdminId(loginAdmin.getAdminId());
		debug.debugging("addBranch", "loginAdmin", loginAdmin.toString());
		
		// 서비스 호출
		int addRow = branchService.addBranch(branch);
		debug.debugging("addBranch", "addRow", addRow); // addRow 값이 2일 경우에 지점 허가 완료
		
		return "redirect:/admin/getWaitingForPermissionList";
	}
}
