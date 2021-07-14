package com.gd.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
