package com.gd.gym.vo;

import lombok.Data;

@Data
public class Permission {
	private int permissionId;
	private int buildingId;
	private int contractId;
	private String description;
	private int permissionLevel;
	private String createDate;
	private String lastUpdate;
}
