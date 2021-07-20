package com.gd.gym.vo;

import lombok.Data;

@Data
public class Building {
	private int buildingId;
	private int memberId;
	private String buildingAddress;
	private String buildingDetail;
	private String createDate;
	private String lastUpdate;
}
