package com.gd.gym.vo;

import lombok.Data;

@Data
public class Contract {
	private int contractId;
	private int adminId;
	private String contractName;
	private int contractLoyalty;
	private String contractDuration;
	private int contractDeposit;
	private String lastUpdate;
}