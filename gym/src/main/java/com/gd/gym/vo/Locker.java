package com.gd.gym.vo;

import lombok.Data;

@Data
public class Locker {
	private int lockerId;
	private int permissionId;
	private String lockerNumber;
	private String lastUpdate;
}
