package com.gd.gym.vo;

import lombok.Data;

@Data
public class QnA {
	private int qnaId;
	private String qnaTitle;
	private String qnaContent;
	private int memberId;
	private String memberName;
	private String createDate;
	private String lastUpdate;
}
