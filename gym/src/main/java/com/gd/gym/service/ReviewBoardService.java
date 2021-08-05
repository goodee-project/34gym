package com.gd.gym.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.ReviewBoardMapper;
import com.gd.gym.vo.Page;
import com.gd.gym.vo.Review;

@Service
@Transactional
public class ReviewBoardService {
	@Autowired ReviewBoardMapper reviewBoardMapper;
	@Autowired private Debug debug;
	
	public List<Map<String, Object>> getReviewList(Page page) {
		//리뷰리스트 매퍼로 셀렉트
		return reviewBoardMapper.selectReviewList(page);
	}
	
	public Map<String, Object> getReviewOne(int reviewId) {
		//리뷰 상세내용
		return reviewBoardMapper.selectReviewOne(reviewId);
	}
	
	public int getReviewTotal() {
		return reviewBoardMapper.selectReviewTotal();
	}
	
	public Map<String, Object> getReviewLikeCheck(int reviewId, int memberId) {
		//좋아요 갯수 확인
		int likeCount = reviewBoardMapper.selectReviewLikeCount(reviewId);
		
		//좋아요 갯수 디버깅
		debug.debugging("getReviewLikeCheck", "likeCount", likeCount);
		
		//좋아요를 한 상태인지 아닌상태인지 기본으로 누르지않은 상태
		Boolean likeFlag = false;
		
		//종아요 테이블에 있는 맴버아이디라면 추가 likeFlag 참
		if(reviewBoardMapper.selectReviewLikeCheck(reviewId,memberId) == 1) {
			//좋아요 누른 상태로 변경
			likeFlag = true;
		}
		
		//맵에 담아서 컨트롤러로 전달
		Map<String, Object> likeMap = new HashMap<>();
		likeMap.put("likeCount", likeCount);
		likeMap.put("likeFlag", likeFlag);
		
		return likeMap;
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
	
	public int addReview(Review review) {
		//리뷰 추가 매퍼 호출
		return reviewBoardMapper.insertReview(review);
	}
	public int modifyReview(Review review) {
		//리뷰 업데이트 매퍼 호출
		return reviewBoardMapper.updateReview(review);
	}
	
	public int removeReview(int reviewId) {
		//리뷰 업데이트 매퍼 호출
		return reviewBoardMapper.deleteReview(reviewId);
	}
}
