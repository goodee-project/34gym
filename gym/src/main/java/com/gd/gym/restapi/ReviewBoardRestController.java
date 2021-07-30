package com.gd.gym.restapi;

import java.util.Map;

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
	public Map<String, Object> getReviewLike(@RequestParam(value="reviewId") int reviewId,
							@RequestParam(value="memberId") int memberId) {
		// 디버깅
		debug.debugging("getReviewLike", "reviewId", reviewId);
		debug.debugging("getReviewLike", "memberId", memberId);
		
		//종아요 갯수와 맴버의 좋아요 상태 전달
		return reviewBoardService.getReviewLikeCheck(reviewId, memberId);
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
