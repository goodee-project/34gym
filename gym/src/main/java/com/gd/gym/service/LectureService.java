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
public class LectureService {
	@Autowired LectureMapper lectureMapper;
	@Autowired Debug de;
	
	// 강의실 목록
	public List<Map<String, Object>> getLectureRoomList(){
		return lectureMapper.selectLectureRoomList();
	}
	
	// 강의실 입력
	public int addLectureRoom(Map<String, Object> map) {
		int addRow = lectureMapper.insertLectureRoom(map);
		de.debugging("addLectureRoom", "Service addrow", addRow);
		return addRow;
	}
	// 강의실 삭제
	public int removeLectureRoom(int lectureRoomId) {
		int removeRow = lectureMapper.deleteLectureRoom(lectureRoomId);
		de.debugging("removeLectureRoom", "Service removeRow", removeRow);
		return removeRow;
	}
	
	// 강의실 수정
	public int modifyLectureRoom(Map<String, Object> map) {
		int modifyRow = lectureMapper.updateLectureRoom(map);
		de.debugging("modifyLectureRoom", "Service modifyRow", modifyRow);
		return modifyRow;
	}
}
