package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Member;
import com.gd.gym.vo.CurrentLectureMember;

@Mapper
public interface MemberMapper {
	int insertMember(Member member);
	Member selectMemberLogin(Member member);
	Integer selectMailCheck(String memberMail);
	Member selectMemberLoginByBranch(Member meber);
	int deleteMember(Member member);
	List<CurrentLectureMember> selectLectureMember(int memberId);
	int updateMemberPw(Member member);
	int updateMember(Member member);
	List<Member> selectMemberOne(int memberId);
}