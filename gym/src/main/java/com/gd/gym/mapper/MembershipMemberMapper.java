package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipAmount;
import com.gd.gym.vo.MembershipMember;

@Mapper
public interface MembershipMemberMapper {
	// 운동이용권 구매
	int insertMembershipMember(MembershipMember membershipMember);
	// 운동이용권 구매비용 추가
	int insertMembershipAmount(MembershipAmount membershipAmount);
	// 구매한 운동이용권 목록
	List<Map<String,Object>> selectMembershipByMemberList(int memberId);
}
