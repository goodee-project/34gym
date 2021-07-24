package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipAmount;
import com.gd.gym.vo.MembershipMember;

@Mapper
public interface MembershipMemberMapper {
	// 운동이용권 구매
	int insertMembershipMember(MembershipMember membershipMember);
	// 운동이용권 구매비용 추가
	int insertMembershipAmount(MembershipAmount membershipAmount);
}
