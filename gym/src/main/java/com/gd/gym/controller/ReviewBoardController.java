package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.ReviewBoardService;
import com.gd.gym.vo.Review;

@Controller
public class ReviewBoardController {
	@Autowired ReviewBoardService reviewBoardService;
	@Autowired private Debug debug;
	
	@GetMapping("/getReviewList")
	public String getReviewList(Model model) {
		List<Review> reviewList = reviewBoardService.getReviewList();
		debug.debugging("getReviewList", reviewList.size());
		
		model.addAttribute("reviewList", reviewList);
		
		return "board/getReviewList";
	}
	
	@GetMapping("/getReviewOne")
	public String getReviewOne(Model model, 
								@RequestParam(value="reviewId", required = true) int reviewId) {
		debug.debugging("getReviewOne", reviewId);
		
		Review reviewOne = reviewBoardService.getReviewOne(reviewId);
		debug.debugging("getReviewOne", reviewOne.toString());
		
		model.addAttribute("reviewOne", reviewOne);
		
		return "board/getReviewOne";
	}
	
	@GetMapping("/addReview")
	public String addReview(Model model, 
								@RequestParam(value="memberId", required = true) int memberId) {
		//매개변수 디버깅
		debug.debugging("addReview","memberId", memberId);
		
		model.addAttribute("memberId", memberId);
		
		return "board/addReview";
	}
	@PostMapping("/addReview")
	public String addReview(Review review) {
		//매개변수 디버깅
		debug.debugging("addReview","review", review.toString());
		
		int addRow = reviewBoardService.insertReview(review);
		
		//리뷰추가 디버깅
		debug.debugging("addReview","addRow", addRow);
		
		return "redirect:/getReviewList";
	}
	
}
