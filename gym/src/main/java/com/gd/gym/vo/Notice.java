package com.gd.gym.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeId;
	private int adminId;
	private String noticeTitle;
	private String noticeContent;
	private String createDate;
	private String lastUpdate;
}
