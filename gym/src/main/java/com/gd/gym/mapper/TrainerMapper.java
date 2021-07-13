package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.TrainerRecruitment;

@Mapper
public interface TrainerMapper {
	// 트레이너 조회
	List<TrainerRecruitment> selectTrainerRecruitmentList();
	// 트레이너 수정
	int updateTrainerRecruitment(TrainerRecruitment trainerRecruitment);
	// 트레이너 삭제
	int deleteTrainerRecruitment(int trainerApplicationId);
}
