package com.gd.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.debug.Debug;

@Controller
public class ReviewBoardController {
	
	@Autowired private Debug debug;
	
	@GetMapping("/getReviewList")
	public String getReviewList( ) {
		return "reviewList";
	}
}
