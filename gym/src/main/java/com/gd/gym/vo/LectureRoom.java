package com.gd.gym.vo;

import lombok.Data;

@Data
public class LectureRoom {
	private int lectureRoomId;
	private int permissionId;
	private String lectureRoomName;
	private String lectureRoomCapacity;
	private String lastUpdate;
}
