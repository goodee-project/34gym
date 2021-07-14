package com.gd.gym.vo;

import lombok.Data;

@Data
public class CurrentLectureMember {
	private int lectureMemberId;
	private int memberId;
	private String memberName;
	private int lectureId;
	private String lectureName;
	private String startDate;
	private String endDate;
}
