package com.gd.gym.vo;

import lombok.Data;

@Data
public class Admin {
	private int adminId;
	private String adminName;
	private String adminMail;
	private String adminPw;
	private String adminAddress;
	private String adminPhone;
	private String createDate;
	private String lastUpdate;
}

