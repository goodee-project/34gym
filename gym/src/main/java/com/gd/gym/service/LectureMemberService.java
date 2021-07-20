package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.LectureMapper;

@Service
@Transactional
public class LectureMemberService {
	@Autowired Debug de;
	@Autowired LectureMapper lectureMapper;
	
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
}
