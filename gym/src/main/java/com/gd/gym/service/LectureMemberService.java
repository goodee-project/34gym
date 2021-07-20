package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.LectureMapper;
import com.gd.gym.mapper.LectureMemberMapper;
import com.gd.gym.vo.LectureAmount;
import com.gd.gym.vo.LectureMember;
import com.gd.gym.vo.LectureMemberForm;

@Service
@Transactional
public class LectureMemberService {
	@Autowired Debug de;
	@Autowired LectureMapper lectureMapper;
	@Autowired LectureMemberMapper lectureMemberMapper;
	
	// 개설강좌 시간표만들기위한 리스트
	public List<Map<String, Object>> getLectureTimetable(int permissionId) {
		de.debugging("getLectureTimetable", "Service permissionId", permissionId);
		return lectureMapper.selectLectureTimetable(permissionId);
	}
	
	// 개설강좌 시간표 상세정보
	public Map<String, Object> getLectureTimetableOne(int lectureId) {
		de.debugging("getLectureTimetableOne", "Service lectureId", lectureId);
		return lectureMapper.selectLectureTimetableOne(lectureId);
	}
	
	// 회원 강좌구매 + 구매기록 추가
	public void addLectureMember(LectureMemberForm lectureMemberForm) {
		// insertLectureMember
		LectureMember lectureMember = lectureMemberForm.getLectureMember();
		de.debugging("addLectureMember", "Service lectureMember", lectureMember.toString());
		lectureMemberMapper.insertLectureMember(lectureMember);
		
		// 생성된 id 가져오기
		int lectureMemberId = lectureMemberForm.getLectureMember().getLectureMemberId();
		de.debugging("addLectureMember", "Service lectureMemberId", lectureMemberId);
		
		// 가져온 Id 주입후 insert 실행
		LectureAmount lectureAmount = lectureMemberForm.getLectureAmount();
		lectureAmount.setLectureMemberId(lectureMemberId);
		lectureMemberMapper.insertLectureAmount(lectureAmount);
	}
}
