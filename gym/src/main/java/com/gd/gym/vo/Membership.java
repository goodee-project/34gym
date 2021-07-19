package com.gd.gym.vo;

import lombok.Data;

@Data
public class Membership {
	private int membershipId;
	private int permissionId;
	private int membershipPriceId;
	private String sold_date;
	private String lastUpdate;
}
