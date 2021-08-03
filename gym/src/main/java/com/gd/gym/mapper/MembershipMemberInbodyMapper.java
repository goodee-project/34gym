package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipMemberInbody;

@Mapper
public interface MembershipMemberInbodyMapper {
	// 트레이너가 관리하는 인바디 목록
	List<Map<String, Object>> selectMembershipMemberInbodyList();
	// 운동이용권 회원 인바디 입력
	int insertMembershipMemberInbody(MembershipMemberInbody membershipMemberInbody);
	// 회원이 보는 인바디 목록
	List<Map<String, Object>> selectMembershipMemberInbodyListById(int memberId);
	// 인바디 상세보기
	Map<String, Object> selectMembershipMemberInbodyOne(int membershipMemberInbodyId);
}
