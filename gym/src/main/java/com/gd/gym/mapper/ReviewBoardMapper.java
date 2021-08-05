package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Page;
import com.gd.gym.vo.Review;

@Mapper
public interface ReviewBoardMapper {
	List<Map<String, Object>> selectReviewList(Page page);
	Map<String, Object> selectReviewOne(int reviewId);
	int selectReviewTotal();
	int selectReviewLikeCount(int reviewId);
	int selectReviewLikeCheck(int reviewId, int memberId);
	int insertReviewLike(int reviewId, int memberId);
	int deleteReviewLike(int reviewId, int memberId);
	int insertReview(Review review);
	int updateReview(Review review);
	int deleteReview(int reviewId);
}
