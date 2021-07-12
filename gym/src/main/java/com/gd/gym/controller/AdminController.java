package com.gd.gym.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.AdminService;
import com.gd.gym.vo.Admin;

@Controller
public class AdminController {
	@Autowired AdminService adminService;
	@Autowired Debug de;
	
	// 관리자 로그인 폼
	@GetMapping("/admin/adminLogin")
	public String adminLogin() {
		return "admin/adminLogin";
	}
	
	// 관리자 로그인 엑션
	@PostMapping("/admin/adminLogin")
	public String adminLogin(Model model, HttpSession session, Admin admin) {
		
		de.debugging("getLoginAdmin", "Controller admin", admin.toString());
		Admin loginAdmin = adminService.getLoginAdmin(admin);
		
		// 로그인성공시 세션에 정보담기
		if(loginAdmin != null) {
			session.setAttribute("loginAdmin", loginAdmin);
		}
		model.addAttribute("loginAdmin", loginAdmin);
		
		return "redirect:/admin/adminLogin";
	}
	
	// 로그아웃
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		de.debugging("logout", "Controller logout", "logout");
		return "redirect:/admin/adminLogin";
	}
	
	// 관리자 목록 리스트
	@GetMapping("/admin/getAdminList")
	public String getAdminList(Model model) {
		List<Admin> adminList = adminService.getAdminList();
		de.debugging("getAdminList", "Controller adminList", adminList.toString());
		
		model.addAttribute("adminList", adminList);
		return "admin/getAdminList";
	}
}
