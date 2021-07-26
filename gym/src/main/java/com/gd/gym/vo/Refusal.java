package com.gd.gym.vo;

import lombok.Data;

@Data
public class Refusal {
	private int permissionId;
	private int adminId;
	private String refusalReason;
	private String lastUpdate;
}
