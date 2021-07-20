package com.gd.gym.vo;

import lombok.Data;

@Data
public class LectureMemberForm {
	private LectureMember lectureMember;
	private LectureAmount lectureAmount;
	private String lectureName; // kakao pay 결제시 상품명 등록
}
