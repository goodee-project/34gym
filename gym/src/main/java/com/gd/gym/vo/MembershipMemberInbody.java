package com.gd.gym.vo;

import lombok.Data;

@Data
public class MembershipMemberInbody {
	private int membershipMemberInbodyId;
	private int membershipMemberEntranceRecordId;
	private int trainerApplicationId;
	private int weight;
	private int skeletalMuscleMass;
	private int bodyFatMass;
	private int BMI;
	private int percentBodyFat;
	private int height;
	private int age;
	private String gender;
	private String inbodyDate;
	private String lastUpdate;
}
