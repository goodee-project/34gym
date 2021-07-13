package com.gd.gym.vo;

import lombok.Data;

@Data
public class LectureMemberEntranceRecord {
	private int lectureMemberEntranceRecordId;
	private int lectureMemberId;
	private int permissionId;
	private String entranceTime;
	private String exitTime;
	private String lastUpdate;
}
