package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TrainerApplicationMapper {
	List<Map<String, Object>> selectTrainerApplicationList();
	Map<String, Object> selectTrainerApplicationOne(int trainerApplicationId);
}
