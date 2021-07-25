package com.gd.gym.vo;

import lombok.Data;

@Data
public class MembershipMember {
	private int membershipMemberId;
	private int permissionId;
	private Integer memberId;
	private int membershipPriceId;
	private String soldDate;
	private String startDate;
	private String endDate;
	private String lastUpdate;
}
