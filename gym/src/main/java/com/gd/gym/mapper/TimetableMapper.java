package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Timetable;

@Mapper
public interface TimetableMapper {
	List<Timetable> selectTimetable();				// 강좌시간표(카테고리) 리스트 
	Timetable selectTimetableOne(int timetableId);	// 강좌시간표(카테고리) 상세목록
	int insertTimetable(Timetable timetable);		// 강좌시간표(카테고리) 등록
	int updateTimetable(Timetable timetable);		// 강좌시간표(카테고리) 수정
	int deleteTimetable(int timetableId);			// 강좌시간표(카테고리) 삭제
}
