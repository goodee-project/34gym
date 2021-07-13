package com.gd.gym.vo;

import lombok.Data;

@Data
public class Resume {
	private int resumeId;
	private int memberId;
	private String career;
	private String type;
	private String resumeImg;
	private String certificate;
	private String resumeContent;
	private String createDate;
	private String lastUpdate;
}
