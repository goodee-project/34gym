package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.LectureMapper;

@Service
@Transactional
public class LectureService {
	@Autowired LectureMapper lectureMapper;
	
	// 강좌 목록(조회)
	public List<Map<String, Object>> getLectureList() {
		return lectureMapper.selectLecture();
	}
}
