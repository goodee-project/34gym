package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MembershipMapper {
	// 운동이용권 조회
	List<Map<String, Object>> selectMembershipList();
}
