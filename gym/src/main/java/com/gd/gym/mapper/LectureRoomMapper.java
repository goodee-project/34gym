package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.LectureRoom;

@Mapper
public interface LectureRoomMapper {
	// 강의실 조회
	List<LectureRoom> selectLectureRoomList();
	// 강의실 등록
	int insertLectureRoom(LectureRoom lectureRoom);
	// 강의실 수정
	int updateLectureRoom(LectureRoom lectureRoom);
	// 강의실 삭제
	int deleteLectureRoom(int lectureRoomId);
}
