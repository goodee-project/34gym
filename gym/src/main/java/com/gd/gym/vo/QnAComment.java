package com.gd.gym.vo;

import lombok.Data;

@Data
public class QnAComment {
	private int commentId;
	private int qnaId;
	private String qnaComment;
	private int memberId;
	private String memberName;
	private String createDate;
	private String lastUpdate;
}
