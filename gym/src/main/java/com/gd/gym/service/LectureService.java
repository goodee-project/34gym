package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.LectureMapper;
import com.gd.gym.vo.Lecture;

@Service
@Transactional
public class LectureService {
	@Autowired LectureMapper lectureMapper;
	
	// 강좌 목록 (조회)
	public List<Map<String, Object>> getLectureList(int permissionId) {
		return lectureMapper.selectLecture(permissionId);
	}
	
	// 강좌 개설 (추가)
	public int addLecture(Lecture lecture) {
		return lectureMapper.insertLecture(lecture);
	}
	
	// 강좌 상세보기
	public Map<String, Object> getLectureOne(Lecture lecture) {
		return lectureMapper.selectLectureOne(lecture);
	}
	
	// 강좌 수정
	public int modifyLecture(Lecture lecture) {
		return lectureMapper.updateLecture(lecture);
	}
	
	// 강좌 삭제
	public int removeLecture(int lectureId) {
		return lectureMapper.deleteLecture(lectureId);
	}
}
