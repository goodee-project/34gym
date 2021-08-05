package com.gd.gym.vo;

import lombok.Data;

@Data
public class Page {
	private int rowPerPage;
	private int beginRow;
	private String searchWord;
}
