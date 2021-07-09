package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.TimetableMapper;
import com.gd.gym.vo.Timetable;

@Service
@Transactional
public class TimetableService {
	@Autowired Debug de;
	@Autowired TimetableMapper timetableMapper;
	
	// 고용형태(카테고리) 목록
	public List<Timetable> getTimetableList(){
		return timetableMapper.selectTimetable();
	}
	
	// 고용형태(카테고리) 입력
	public int addTimetable(Timetable timetable) {
		int addRow = timetableMapper.insertTimetable(timetable);
		de.debugging("addTimetable", "Service addrow",addRow);
		return addRow;
	}
	// 고용형태(카테고리) 삭제
	public int removeTimetable(int timetableId) {
		int removeRow = timetableMapper.deleteTimetable(timetableId);
		de.debugging("removeTimetable", "Service removeRow",removeRow);
		return removeRow;
	}
	
	// 고용형태(카테고리) 수정
	public int modifyTimetable(Timetable timetable) {
		int modifyRow = timetableMapper.updateTimetable(timetable);
		de.debugging("modifyTimetable", "Service modifyRow",modifyRow);
		return modifyRow;
	}
	
	// 고용형태(카테고리) 상세목록
	public Timetable getTimetableOne(int timetableId) {
		return timetableMapper.selectTimetableOne(timetableId);
	}
}
