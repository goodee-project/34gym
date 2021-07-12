package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureMapper {
	// 강의실 조회
	List<Map<String, Object>> selectLectureRoomList();
	// 강의실 등록
	int insertLectureRoom(Map<String, Object> map);
	// 강의실 수정
	int updateLectureRoom(Map<String, Object> map);
	// 강의실 삭제
	int deleteLectureRoom(int lectureRoomId);
}
