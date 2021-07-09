package com.gd.gym.vo;

import lombok.Data;

@Data
public class Timetable {
	private int timetableId;
	private String timetableDay;
	private String timetablePeriod;
	private String lastUpdate;
}
