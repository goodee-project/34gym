package com.gd.gym.vo;

import lombok.Data;

@Data
public class TrainerApplication {
	private int trainerApplicationId;
	private int resumeId;
	private int jobOpeningId;
	private String applyDate;
	private String lastUpdate;
}
