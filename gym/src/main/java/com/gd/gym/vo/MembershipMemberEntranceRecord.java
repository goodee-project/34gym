package com.gd.gym.vo;

import lombok.Data;

@Data
public class MembershipMemberEntranceRecord {
	private int membershipMemberEntranceRecordId;
	private int membershipMemberId;
	private int permissionId;
	private String entranceTime;
	private String exitTime;
	private String lastUpdate;
}
