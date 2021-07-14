package com.gd.gym.restapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.ReviewBoardService;

@RestController
@CrossOrigin
public class ReviewBoardRestController {
	@Autowired private Debug debug;
	@Autowired ReviewBoardService reviewBoardService;
	
	@GetMapping("/getReviewLike")
	@ResponseBody
	public int getReviewLike(@RequestParam(value="reviewId") int reviewId) {
		// 디버깅
		debug.debugging("getReviewLike", "reviewId", reviewId);
		
		return reviewBoardService.getReviewLikeCount(reviewId);
	}
	
	@GetMapping("/toggleReviewLike")
	@ResponseBody
	public void toggleReviewLike(@RequestParam(value="reviewId") int reviewId,
								@RequestParam(value="memberId") int memberId) {
		// 매개변수 디버깅
		debug.debugging("toggleReviewLike", "reviewId", reviewId);
		debug.debugging("toggleReviewLike", "memberId", memberId);
		reviewBoardService.toggleReviewLike(reviewId, memberId);

	}
	
}
