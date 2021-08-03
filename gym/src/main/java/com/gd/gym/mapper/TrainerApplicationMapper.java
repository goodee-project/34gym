package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TrainerApplicationMapper {
	// 강사지원 목록
	List<Map<String, Object>> selectTrainerApplicationList(int permissionId);
	// 강사지원 상세보기
	Map<String, Object> selectTrainerApplicationOne(int trainerApplicationId);
	
	List<Map<String, Object>> selectTrainerApplicationByMemberList(int memberId);
}
