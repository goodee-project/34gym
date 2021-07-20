package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.LectureRoomMapper;
import com.gd.gym.vo.LectureRoom;

@Service
@Transactional
public class LectureRoomService {
	@Autowired LectureRoomMapper lectureRoomMapper;
	@Autowired Debug de;
	
	// 강의실 목록
	public List<LectureRoom> getLectureRoomList(){
		return lectureRoomMapper.selectLectureRoomList();
	}
	
	// 강의실 입력
	public int addLectureRoom(LectureRoom lectureRoom) {
		int addRow = lectureRoomMapper.insertLectureRoom(lectureRoom);
		de.debugging("addLectureRoom", "Service addrow", addRow);
		return addRow;
	}
	
	// 강의실 삭제
	public int removeLectureRoom(int lectureRoomId) {
		int removeRow = lectureRoomMapper.deleteLectureRoom(lectureRoomId);
		de.debugging("removeLectureRoom", "Service removeRow", removeRow);
		return removeRow;
	}
	
	// 강의실 수정
	public int modifyLectureRoom(LectureRoom lectureRoom) {
		int modifyRow = lectureRoomMapper.updateLectureRoom(lectureRoom);
		de.debugging("modifyLectureRoom", "Service modifyRow", lectureRoom.toString());
		return modifyRow;
	}
}
