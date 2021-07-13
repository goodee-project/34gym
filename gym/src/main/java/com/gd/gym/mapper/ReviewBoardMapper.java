package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Review;

@Mapper
public interface ReviewBoardMapper {
	List<Review> selectReviewList();
	Review selectReviewOne(int reviewId);
	int selectReviewLikeCount(int reviewId);
	int selectReviewLikeCheck(int reviewId, int memberId);
	int insertReviewLike(int reviewId, int memberId);
	int deleteReviewLike(int reviewId, int memberId);
	int selectLectureMember(int memberId);
	int insertReview(Review review);
	int updateReview(Review review);
}
