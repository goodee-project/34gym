package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipMemberInbody;

@Mapper
public interface MembershipMemberInbodyMapper {
	// 운동이용권 회원 인바디 입력
	int insertMembershipMemberInbody(MembershipMemberInbody membershipMemberInbody);
	// 운동이용권 회원 인바디 목록
	List<Map<String, Object>> selectMembershipMemberInbodyList(int memberId);
}