package com.gd.gym.vo;

import lombok.Data;

@Data
public class Page {
	private int rowperPage;
	private int beginRow;
	private String searchWord;
}
