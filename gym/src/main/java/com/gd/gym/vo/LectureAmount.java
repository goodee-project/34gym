package com.gd.gym.vo;

import lombok.Data;

@Data
public class LectureAmount {
	private int lectureAmountId;
	private int lectureMemberId;
	private String amount;
	private String lastUpdate;
}
