package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipMember;

@Mapper
public interface MembershipMemberMapper {
	// 운동이용권 구매
	int insertMembershipMember(MembershipMember membershipMember);
	
	//
	int insertMembershipAmount();
}
