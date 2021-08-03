package com.gd.gym.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TrainerMemberMapper {
	// 트레이너 데이터 세션 저장용
	Map<String, Object> selectMemberLoginByTrainer(Map<String, Object> map);
}
