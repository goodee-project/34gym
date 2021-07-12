package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReviewBoardMapper {
	List<Map<String,Object>> selectReviewList();
	Map<String,Object> selectReviewOne(int reviewId);
	int selectReviewLikeCount(int reviewId);
	int selectReviewLikeCheck(int reviewId, int memberId);
	int insertReviewLike(int reviewId, int memberId);
	int deleteReviewLike(int reviewId, int memberId);
}
