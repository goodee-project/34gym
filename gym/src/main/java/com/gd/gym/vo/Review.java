package com.gd.gym.vo;

import lombok.Data;

@Data
public class Review {
	private int reviewId;
	private int lectureMemberId;
	private String reviewTitle;
	private String reviewContent;
	private int reviewScore;
	private String createDate;
	private String lastDate;
	
}
