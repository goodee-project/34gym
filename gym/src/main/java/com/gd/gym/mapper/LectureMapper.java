package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Lecture;
import com.gd.gym.vo.LectureRoom;

@Mapper
public interface LectureMapper {
	List<Map<String, Object>> selectLecture(int permissionId);
	/* List<Branch> selectBranchName(); */
	List<Map<String, Object>> selectUsableTimetableById(int permissionId);
	List<Map<String, Object>> selectTrainerById(int permissionId);
	/* List<LectureCategory> selectLectureCategory(); */
	List<LectureRoom> selectLectureRoomById(int permissionId);
	int insertLecture(Lecture lecture);
	int updateLecture(Lecture lecture);
	int deleteLecture(int lectureId);
	Map<String, Object>selectLectureOne(Lecture lecture);
	List<Map<String, Object>> selectLectureTimetable(int permissionId);
}
