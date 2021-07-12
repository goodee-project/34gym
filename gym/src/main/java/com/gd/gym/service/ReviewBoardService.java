package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.ReviewBoardMapper;

@Service
@Transactional
public class ReviewBoardService {
	@Autowired ReviewBoardMapper reviewBoardMapper;
	@Autowired private Debug debug;
	
	public List<Map<String, Object>> getReviewList() {
		return reviewBoardMapper.selectReviewList();
	}
	
	public Map<String, Object> getReviewOne(int reviewId) {
		return reviewBoardMapper.selectReviewOne(reviewId);
	}
	
	public int getReviewListCount(int reviewId) {
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
	
}
