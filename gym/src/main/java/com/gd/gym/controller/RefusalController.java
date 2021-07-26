package com.gd.gym.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.RefusalService;
import com.gd.gym.vo.Admin;
import com.gd.gym.vo.Refusal;

@Controller
public class RefusalController {
	@Autowired RefusalService refusalService;
	@Autowired Debug de;
	
	// 지점 거부 폼
	@GetMapping("/admin/addRefusal")
	public String addRefusal(Model model, @RequestParam(value="permissionId", required = true) int permissionId) {
		// 매개변수 디버깅
		de.debugging("addRefusal", "permissionId", permissionId);
		
		model.addAttribute("permissionId", permissionId);
		
		return "admin/addRefusal";
	}
	
	// 지점 거부 액션
	@PostMapping("/admin/addRefusal")
	public String addRefusal(HttpSession session, Refusal refusal) {
		// 매개변수 디버깅
		de.debugging("addRefusal", "refusal", refusal.toString());
		
		// 매개변수 가공
		Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
		refusal.setAdminId(loginAdmin.getAdminId());
		de.debugging("addRefusal", "loginAdmin", loginAdmin.toString());
		
		// 서비스 호출
		int addRow = refusalService.addRefusal(refusal);
		de.debugging("addRefusal", "addRow", addRow); // addRow 값이 2일 경우에 지점 거부 완료
		
		return "redirect:/admin/getWaitingForPermissionList";
	}
}
