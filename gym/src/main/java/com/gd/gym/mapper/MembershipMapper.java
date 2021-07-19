package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.LectureRoom;
import com.gd.gym.vo.Membership;

@Mapper
public interface MembershipMapper {
	// 운동이용권 조회
	List<Map<String, Object>> selectMembershipList();
	// 운동이용권 수정
	int updateMembership(int membershipId);
}
