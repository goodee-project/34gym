package com.gd.gym.vo;

import lombok.Data;

@Data
public class MembershipPrice {
	private int membershipPriceId;
	private String membershipName;
	private int membershipPrice;
	private String startDate;
	private String endDate;
	private String lastUpdate;
}
