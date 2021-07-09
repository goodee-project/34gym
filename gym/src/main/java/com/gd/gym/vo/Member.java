package com.gd.gym.vo;

import lombok.Data;

@Data
public class Member {
	private int memberId;
	private String memberName;
	private String memberMail;
	private String memberPw;
	private String memberAddress;
	private String memberPhone;
	private String createDate;
	private String lastUpdate;
	private int postCode;
	private String memberDetailAddress;
	private String memberExtraAddress;
}
