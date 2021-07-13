package com.gd.gym.vo;

import lombok.Data;

@Data
public class BranchMember {
	private int memberId;
	private int permissionId;
	private String memberName;
	private String memberMail;
	private String memberPw;
	private String branchName;
}
