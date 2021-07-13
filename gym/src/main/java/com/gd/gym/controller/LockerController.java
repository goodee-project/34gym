package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LockerService;
import com.gd.gym.vo.Locker;

@Controller
public class LockerController {
	@Autowired Debug de;
	@Autowired LockerService lockerService;
	
	// 락커 목록
	@GetMapping("/branch/getLockerList")
	public String getLockerList(Model model) {
		
		List<Locker> lockerList = lockerService.getLockerList();
		de.debugging("lockerList", "getLockerList Controller", lockerList.toString());
		model.addAttribute("lockerList", lockerList);
		return "branch/getLockerList";
	}
	
	// 지점별 락커추가 폼
	@GetMapping("/branch/addLockerByBranch")
	public String addLockerByBranch(Model model) {
		
		return "branch/addLockerByBranch";
	}
	// 지점별 락커추가 엑션
	@PostMapping("/branch/addLockerByBranch")
	public String addLockerByBranch(@RequestParam(value="count", required = true) int count, 
									@RequestParam(value="permissionId", required = true) int permissionId, 
									@RequestParam(value="branchName", required = true) String branchName) {
		
		de.debugging("addLockerByBranch", "count Controller", count);
		de.debugging("addLockerByBranch", "permissionId Controller", permissionId);
		de.debugging("addLockerByBranch", "branchName Controller", branchName);
		
		lockerService.addLockerByBranch(count, permissionId, branchName);
		return "redirect:/branch/getLockerList";
	}
}
