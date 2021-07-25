package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.LectureAmount;
import com.gd.gym.vo.LectureMember;

@Mapper
public interface LectureMemberMapper {
	int insertLectureMember(LectureMember lectureMember);
	int insertLectureAmount(LectureAmount lectureAmount);
	int selectLectureMeberCheck(LectureMember lectureMember);
}
