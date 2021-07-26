package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.LectureAmount;
import com.gd.gym.vo.LectureMember;

@Mapper
public interface LectureMemberMapper {
	int insertLectureMember(LectureMember lectureMember);
	int insertLectureAmount(LectureAmount lectureAmount);
	int selectLectureMeberCheck(LectureMember lectureMember);
	List<Map<String, Object>> selectLectureByMemberList(int memberId);
	int selectlectureMemberCntByLecture(int lectureId);
}
