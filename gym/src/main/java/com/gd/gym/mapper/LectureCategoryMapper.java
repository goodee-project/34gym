package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.LectureCategory;

@Mapper
public interface LectureCategoryMapper {
	List<LectureCategory> selectLectureCategory();						// 강좌(카테고리) 리스트 
	LectureCategory selectLectureCategoryOne(int lectureCategoryId);	// 강좌(카테고리) 상세목록
	int insertLectureCategory(LectureCategory LectureCategory);			// 강좌(카테고리) 등록
	int updateLectureCategory(LectureCategory LectureCategory);			// 강좌(카테고리) 수정
	int deleteLectureCategory(int lectureCategoryId);					// 강좌(카테고리) 삭제
}
