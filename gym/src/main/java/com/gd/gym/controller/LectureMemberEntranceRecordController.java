package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LectureMemberEntranceRecordService;
import com.gd.gym.vo.LectureMemberEntranceRecord;

@Controller
public class LectureMemberEntranceRecordController {
	@Autowired LectureMemberEntranceRecordService lectureMemberEntranceRecordService;
	@Autowired Debug de;
	
	// 강좌회원 출입기록 조회(목록) 맵핑
	@GetMapping("/branch/getLectureMemberEntranceRecordList")
	public String getLectureMemberEntranceRecordList(Model model) {
		// 서비스 호출
		List<LectureMemberEntranceRecord> recordList = lectureMemberEntranceRecordService.getLectureMemberEntranceRecordList();
		// 결과물 디버깅
		de.debugging("getLectureMemberEntranceRecordList", "recordList", recordList.toString());
		
		model.addAttribute("recordList", recordList);
		
		return "branch/getLectureMemberEntranceRecordList";
	}
}
