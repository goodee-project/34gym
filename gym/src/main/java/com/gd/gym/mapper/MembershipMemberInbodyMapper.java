package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipMemberInbody;

@Mapper
public interface MembershipMemberInbodyMapper {
	// 운동이용권 회원 인바디 입력
	int insertMembershipMemberInbody(MembershipMemberInbody membershipMemberInbody);
}
