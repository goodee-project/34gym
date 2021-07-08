package com.gd.gym.vo;

import lombok.Data;

@Data
public class UniformRentalPrice {
	private int uniformRentalPriceId;
	private int uniformRentalPrice;
	private String startDate;
	private String endDate;
	private String lastUpdate;
}
