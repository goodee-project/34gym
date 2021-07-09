package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Member;

@Mapper
public interface MemberMapper {
	int insertMember(Member member);
	Member selectMemberLogin(Member member);
}