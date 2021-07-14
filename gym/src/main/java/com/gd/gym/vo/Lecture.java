package com.gd.gym.vo;

import lombok.Data;

@Data
public class Lecture {
	private int lectureId;
	private int trainerApplicationId;
	private int timetableId;
	private int lectureRoomId;
	private int lectureCategoryId;
	private int permissionId;
	private String lectureName;
	private int lecturePrice;
	private String startDate;
	private String endDate;
}
