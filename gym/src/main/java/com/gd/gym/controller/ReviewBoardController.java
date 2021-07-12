package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.ReviewBoardService;

@Controller
public class ReviewBoardController {
	@Autowired ReviewBoardService reviewBoardService;
	@Autowired private Debug debug;
	
	@GetMapping("/getReviewList")
	public String getReviewList(Model model) {
		List<Map<String, Object>> reviewList = reviewBoardService.getReviewList();
		debug.debugging("getReviewList", reviewList.size());
		
		model.addAttribute("reviewList", reviewList);
		
		return "board/getReviewList";
	}
	
	@GetMapping("/getReviewOne")
	public String getReviewOne(Model model, 
								@RequestParam(value="reviewId", required = true) int reviewId) {
		debug.debugging("getReviewOne", reviewId);
		
		Map<String, Object> reviewOne = reviewBoardService.getReviewOne(reviewId);
		debug.debugging("getReviewOne", reviewOne.size());
		
		int reviewLikeCount = reviewBoardService.getReviewListCount(reviewId);
		debug.debugging("reviewLikeCount", reviewLikeCount);
		
		model.addAttribute("reviewOne", reviewOne);
		model.addAttribute("reviewLikeCount", reviewLikeCount);
		
		return "board/getReviewOne";
	}
	
}
