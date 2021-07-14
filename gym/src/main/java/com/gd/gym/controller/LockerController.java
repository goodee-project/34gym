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
import com.gd.gym.mapper.BranchMapper;
import com.gd.gym.mapper.LockerMapper;
import com.gd.gym.service.LockerService;
import com.gd.gym.vo.BranchMember;
import com.gd.gym.vo.Locker;

@Controller
public class LockerController {
	@Autowired Debug de;
	@Autowired LockerService lockerService;
	@Autowired BranchMapper branchMapper; 		// addLockerByBranch 셀렉박스 생성용
	@Autowired LockerMapper lockerMapper;
	// 락커 목록
	@GetMapping("/branch/getLockerList")
	public String getLockerList(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.getAttribute("loginBranch");
		
		int permissionId = ((BranchMember)(session.getAttribute("loginBranch"))).getPermissionId();
		de.debugging("getLockerList", "Controller permissionId", permissionId);
		
		List<Locker> lockerList = lockerService.getLockerList(permissionId);
		de.debugging("lockerList", "getLockerList Controller", lockerList.toString());
		model.addAttribute("lockerList", lockerList);
		return "branch/getLockerList";
	}
	
	// 지점별 락커추가 폼
	@GetMapping("/branch/addLocker")
	public String addLocker(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		session.getAttribute("loginBranch");
		
		int permissionId = ((BranchMember)(session.getAttribute("loginBranch"))).getPermissionId();
		de.debugging("addLocker", "Controller permissionId", permissionId);
		int branchLockerCnt = lockerMapper.selectLockerTotalCntByBranch(permissionId);
		
		model.addAttribute("branchLockerCnt", branchLockerCnt);
		return "branch/addLocker";
	}
	// 지점별 락커추가 엑션
	@PostMapping("/branch/addLocker")
	public String addLocker(@RequestParam(value="count", required = true) int count, 
									@RequestParam(value="permissionId", required = true) int permissionId, 
									@RequestParam(value="branchName", required = true) String branchName) {
		
		de.debugging("addLockerByBranch", "count Controller", count);
		de.debugging("addLockerByBranch", "permissionId Controller", permissionId);
		de.debugging("addLockerByBranch", "branchName Controller", branchName);
		
		lockerService.addLocker(count, permissionId, branchName);
		return "redirect:/branch/getLockerList";
	}
}
