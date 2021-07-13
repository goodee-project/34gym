package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.ReviewBoardMapper;
import com.gd.gym.vo.Review;

@Service
@Transactional
public class ReviewBoardService {
	@Autowired ReviewBoardMapper reviewBoardMapper;
	@Autowired private Debug debug;
	
	public List<Review> getReviewList() {
		return reviewBoardMapper.selectReviewList();
	}
	
	public Review getReviewOne(int reviewId) {
		return reviewBoardMapper.selectReviewOne(reviewId);
	}
	
	public int getReviewLikeCount(int reviewId) {
		return reviewBoardMapper.selectReviewLikeCount(reviewId);
	}
	
	public void toggleReviewLike(int reviewId, int memberId) {
		
		if(reviewBoardMapper.selectReviewLikeCheck(reviewId,memberId) == 0) {
			reviewBoardMapper.insertReviewLike(reviewId, memberId);
		}
		else {
			reviewBoardMapper.deleteReviewLike(reviewId, memberId);
		}
	}
	
	public int checkLectureMember(int memberId) {
		return reviewBoardMapper.selectLectureMember(memberId);
	}
	
	public int insertReview(Review review) {
		return reviewBoardMapper.insertReview(review);
	}
	 
}
