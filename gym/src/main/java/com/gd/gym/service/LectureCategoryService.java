package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.LectureCategoryMapper;
import com.gd.gym.vo.LectureCategory;

@Service
@Transactional
public class LectureCategoryService {
	@Autowired Debug de;
	@Autowired LectureCategoryMapper lectureCategoryMapper;
	
	// 강좌 카테고리 목록
	public List<LectureCategory> getLectureCategoryList(){
		return lectureCategoryMapper.selectLectureCategory();
	}
	
	// 강좌 카테고리 입력
	public int addLectureCategory(LectureCategory lectureCategory) {
		int addRow = lectureCategoryMapper.insertLectureCategory(lectureCategory);
		de.debugging("addLectureCategory", "Service addrow",addRow);
		return addRow;
	}
	// 강좌 카테고리 삭제
	public int removeLectureCategory(int lectureCategoryId) {
		int removeRow = lectureCategoryMapper.deleteLectureCategory(lectureCategoryId);
		de.debugging("removeLectureCategory", "Service removeRow",removeRow);
		return removeRow;
	}
	
	// 강좌 카테고리 수정
	public int modifyLectureCategory(LectureCategory lectureCategory) {
		int modifyRow = lectureCategoryMapper.updateLectureCategory(lectureCategory);
		de.debugging("modifyLectureCategory", "Service modifyRow",modifyRow);
		return modifyRow;
	}
	
	// 강좌 카테고리 상세목록
	public LectureCategory getLectureCategoryOne(int lectureCategoryId) {
		return lectureCategoryMapper.selectLectureCategoryOne(lectureCategoryId);
	}
}
