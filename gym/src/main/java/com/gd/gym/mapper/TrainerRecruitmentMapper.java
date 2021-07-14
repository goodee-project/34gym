package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.TrainerRecruitment;

@Mapper
public interface TrainerRecruitmentMapper {
	// 트레이너 조회
	List<Map<String, Object>> selectTrainerRecruitmentList();
	// 트레이너 수정
	int updateTrainerRecruitment(TrainerRecruitment trainerRecruitment);
	// 강사채용 수정 시 기존 정보 가져오기
	Map<String, Object> selectTrainerRecruitmentById(int trainerApplicationId);
	// 트레이너 삭제
	int deleteTrainerRecruitment(int trainerApplicationId);
	// 트레이너 상세보기
	Map<String, Object> selectTrainerRecruitmentOne(int trainerApplicationId);
}
