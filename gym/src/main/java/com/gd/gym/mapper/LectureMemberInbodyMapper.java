package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.LectureMemberInbody;

@Mapper
public interface LectureMemberInbodyMapper {
	// 강좌 회원 인바디 입력
	int insertLectureMemberInbody(LectureMemberInbody lectureMemberInbody);
	// 강좌 회원 인바디 목록
	List<Map<String, Object>> selectLectureMemberInbodyList(int memberId);
	// 인바디 상세보기
	Map<String, Object> selectLectureMemberInbodyOne(int lectureMemberInbodyId);
}
