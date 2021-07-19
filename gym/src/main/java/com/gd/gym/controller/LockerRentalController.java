package com.gd.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LockerRentalService;

@Controller
public class LockerRentalController {
	@Autowired Debug de;
	@Autowired LockerRentalService locRentalService;
/*	
	// 사용X 매커니즘 변경 예정
	@GetMapping("/branch/addLockerRental")
	public String addLockerRental(@RequestParam(value = "permissionId", required = true) int permissionId) {
		de.debugging("addLockerRental", "Controller permissionId", permissionId);
		
		locRentalService.addLockerRental(permissionId);
		return "redirect:/branch/getLockerList";
	}
	
	// 사용X 매커니즘 변경 예정
	@GetMapping("/member/getLockerRentalList")
	public String getLockerRentalList(Model model) {
		int permissionId = 1;
		de.debugging("getLockerRentalList", "Controller permissionId", permissionId);
		List<Map<String,Object>> lockerRentalCheckList = locRentalService.getLockerRentalCheck(permissionId);
		
		model.addAttribute("lockerRentalCheckList", lockerRentalCheckList);
		return "member/getLockerRentalList";
	}
*/	
}
