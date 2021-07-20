package com.gd.gym.vo;

import lombok.Data;

@Data
public class LectureMember {
	private int LectureMemberId;
	private int LectureId;
	private int memberId;
	private String lastUpdate;
}
