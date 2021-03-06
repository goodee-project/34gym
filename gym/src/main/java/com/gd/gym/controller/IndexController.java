package com.gd.gym.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.debug.Debug;

@Controller
public class IndexController {
	@Autowired Debug de;
	
	@GetMapping({"/", "/home", "/index"})
	public String hello() {
		return "index";
	}
	@GetMapping("/login")
	public String login() {
		return "login";
	}
}
