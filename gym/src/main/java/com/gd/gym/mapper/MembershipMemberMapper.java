package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipMember;

@Mapper
public interface MembershipMemberMapper {
	int insertMembershipMember(MembershipMember membershipMember);
}
