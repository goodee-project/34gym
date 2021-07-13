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
		//리뷰리스트 매퍼로 셀렉트
		return reviewBoardMapper.selectReviewList();
	}
	
	public Review getReviewOne(int reviewId) {
		//리뷰 상세내용
		return reviewBoardMapper.selectReviewOne(reviewId);
	}
	
	public int getReviewLikeCount(int reviewId) {
		//좋아요 갯수 확인
		return reviewBoardMapper.selectReviewLikeCount(reviewId);
	}
	
	public void toggleReviewLike(int reviewId, int memberId) {
		//종아요 테이블에 없는 아이디라면 추가 == 좋아요 + 1
		if(reviewBoardMapper.selectReviewLikeCheck(reviewId,memberId) == 0) {
			reviewBoardMapper.insertReviewLike(reviewId, memberId);
		}
		//이미 좋아요를 누른 상태였다면 좋아요 - 1
		else {
			reviewBoardMapper.deleteReviewLike(reviewId, memberId);
		}
	}
	
	public int getLectureMemberId(int memberId) {
		//회원 아이디가 강좌회원에 있는지 확인(강좌회원인지 확인하는작업)
		return reviewBoardMapper.selectLectureMember(memberId);
	}
	
	public int addReview(Review review) {
		//리뷰 추가 매퍼 호출
		return reviewBoardMapper.insertReview(review);
	}
	public int modifyReview(Review review) {
		//리뷰 업데이트 매퍼 호출
		return reviewBoardMapper.updateReview(review);
	}
	 
}
