package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.TrainerApplication;

@Mapper
public interface TrainerApplicationMapper {
	// 강사지원 목록
	List<Map<String, Object>> selectTrainerApplicationList(int permissionId);
	// 강사지원 상세보기
	Map<String, Object> selectTrainerApplicationOne(int trainerApplicationId);
}
