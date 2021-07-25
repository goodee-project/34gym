package com.gd.gym.vo;

import lombok.Data;

@Data
public class MembershipAmount {
	private int membershipAmountId;
	private int membershipMemberId;
	private int amount;
	private String lastUpdate;
}
