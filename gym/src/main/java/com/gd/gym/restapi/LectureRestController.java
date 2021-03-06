package com.gd.gym.restapi;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.BranchMapper;
import com.gd.gym.mapper.LectureCategoryMapper;
import com.gd.gym.mapper.LectureMapper;
import com.gd.gym.vo.Branch;
import com.gd.gym.vo.LectureCategory;
import com.gd.gym.vo.LectureRoom;

@RestController
@CrossOrigin
public class LectureRestController {
	@Autowired LectureMapper lectureMapper;
	@Autowired BranchMapper branchMapper;
	@Autowired LectureCategoryMapper lectureCategoryMapper;
	@Autowired Debug de;
	
	// 지점에 따른 개설 가능한 요일/시간 정보 조회
	@GetMapping("/usableTimetable")
	@ResponseBody
	public List<Map<String, Object>> getUsableTimetableList(@RequestParam(value="permissionId") int permissionId) {
		// 매개변수 디버깅
		de.debugging("getUsableTimetableList", "permissionId", permissionId);
		
		// 맵퍼 호출
		List<Map<String, Object>> timetableList = lectureMapper.selectUsableTimetableById(permissionId);
		// 결과물 가공
		List<Map<String, Object>> usableTimetableList = new ArrayList<>();
		for(int i=0; i<timetableList.size(); i++) { // for문과 조건문을 활용해서 조건에 맞는 시간대만 list에 추가함
			if(timetableList.get(i).get("usable").equals("O")) {
				usableTimetableList.add(timetableList.get(i));
			}
		}
		// 뷰에 넘길 결과물 디버깅
		de.debugging("getUsableTimetableList", "usableTimetableList", usableTimetableList.toString());
		
		return usableTimetableList;
	}
	
	// 지점에 따른 강사 정보 조회
	@GetMapping("/trainer")
	@ResponseBody
	public List<Map<String, Object>> getTrainerList(@RequestParam(value="permissionId") int permissionId) {
		// 매개변수 디버깅
		de.debugging("getTrainerList", "permissionId", permissionId);
		
		// 맵퍼 호출
		List<Map<String, Object>> trainerList = lectureMapper.selectTrainerById(permissionId);
		// 디버깅
		de.debugging("getTrainerList", "trainerList", trainerList.toString());
		
		return trainerList;
	}
	
	// 강좌 카테고리 조회
	@GetMapping("/lectureCategory")
	@ResponseBody
	public List<LectureCategory> getLectureCategoryList() {
		// 맵퍼 호출
		List<LectureCategory> lectureCategoryList = lectureCategoryMapper.selectLectureCategory();
		// 디버깅
		de.debugging("getLectureCategory", "lectureCategoryList", lectureCategoryList.toString());
		
		return lectureCategoryList;
	}
	
	// 지점에 따른 강의실 정보 조회
	@GetMapping("/lectureRoom")
	@ResponseBody
	public List<LectureRoom> getLectureRoomList(@RequestParam(value="permissionId") int permissionId) {
		// 매개변수 디버깅
		de.debugging("getLectureRoomList", "permissionId", permissionId);
		
		// 맵퍼 호출
		List<LectureRoom> lectureRoomList = lectureMapper.selectLectureRoomById(permissionId);
		// 디버깅
		de.debugging("getLectureRoomList", "lectureRoomList", lectureRoomList.toString());
		
		return lectureRoomList;
	}
}
