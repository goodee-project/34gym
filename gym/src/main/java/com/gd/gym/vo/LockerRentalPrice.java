package com.gd.gym.vo;

import lombok.Data;

@Data
public class LockerRentalPrice {
	private int lockerRentalPriceId;
	private int lockerRentalPrice;
	private String startDate;
	private String endDate;
	private String lastUpdate;
}
