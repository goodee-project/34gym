package com.gd.gym.controller;

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
public class HelloController {
	@Autowired AdminService AdminService;
	
	Debug de = new Debug();
	
	@GetMapping("/hello")
	public String hello() {
		return "hello";
	}
	
	@PostMapping("getLoginAdmin")
	public String getLoginAdmin(Model model, HttpSession session, Admin admin) {
		
		
		de.debugging("getLoginAdmin", "admin", admin.toString());
		Admin loginAdmin = AdminService.getLoginAdmin(admin);
		de.debugging("getLoginAdmin", "DB 연동 로그인 테스트");
		de.debugging("getLoginAdmin", 123455);
		//log.debug(loginAdmin+"DB 연동 로그인 테스트");
		if(loginAdmin != null) {	// 로그인성공시 세션에 정보담기
			session.setAttribute("loginAdmin", loginAdmin);
		}
		model.addAttribute("loginAdmin", loginAdmin);
		return "redirect:/hello";
	}
	
	// 로그아웃
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/hello";
	}
}
