package com.gd.gym.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
	public int addLectureCategory(MultipartFile multipartFile, LectureCategory lectureCategory) {
		
		// 1) 물리적 파일 저장
		File temp = new File("");
		String path = temp.getAbsolutePath(); // 프로젝트 경로ㅊ
		// 확장자
		int p = multipartFile.getOriginalFilename().lastIndexOf(".");
		String ext = multipartFile.getOriginalFilename().substring(p).toLowerCase();
		// 확장자를 제외한 파일이름
		String prename = "img_"+lectureCategory.getLectureCategory();
		
		File file = new File(path + "\\src\\main\\webapp\\img\\classes\\"+prename+ext);
		try {
			multipartFile.transferTo(file); // multipartFile안에 파일을 빈file로 복사
		} catch(Exception e) {
			throw new RuntimeException();
		}
		
		// 객체 주입
		lectureCategory.setLecutureCategoryImg(prename+ext);
		lectureCategory.setLecutureCategoryImgSize(multipartFile.getSize());
		lectureCategory.setLecutureCategoryImgType(multipartFile.getContentType());
		
		// 강좌 카테고리 등록
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
