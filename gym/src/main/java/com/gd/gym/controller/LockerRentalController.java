package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LockerRentalService;

@Controller
public class LockerRentalController {
	@Autowired Debug de;
	@Autowired LockerRentalService locRentalService;
	
	@GetMapping("/branch/addLockerRental")
	public String addLockerRental(@RequestParam(value = "permissionId", required = true) int permissionId) {
		de.debugging("addLockerRental", "Controller permissionId", permissionId);
		
		locRentalService.addLockerRental(permissionId);
		return "redirect:/branch/getLockerList";
	}
	
	@GetMapping("/member/getLockerRentalList")
	public String getLockerRentalList(Model model) {
		int permissionId = 1;
		de.debugging("getLockerRentalList", "Controller permissionId", permissionId);
		List<Map<String,Object>> lockerRentalCheckList = locRentalService.getLockerRentalCheck(permissionId);
		
		model.addAttribute("lockerRentalCheckList", lockerRentalCheckList);
		return "member/getLockerRentalList";
	}
}
