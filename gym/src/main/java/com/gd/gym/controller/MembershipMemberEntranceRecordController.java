package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MembershipMemberEntranceRecordService;
import com.gd.gym.vo.MembershipMemberEntranceRecord;

@Controller
public class MembershipMemberEntranceRecordController {
	@Autowired MembershipMemberEntranceRecordService membershipMemberEntranceRecordService;
	@Autowired Debug de;
	
	// 운동회원 출입기록 조회(목록) 맵핑
	@GetMapping("/branch/getMembershipMemberEntranceRecordList")
	public String getMembershipMemberEntranceRecordList(Model model) {
		// 서비스 호출
		List<MembershipMemberEntranceRecord> recordList = membershipMemberEntranceRecordService.getMembershipMemberEntranceRecordList();
		// 결과물 디버깅
		de.debugging("getMembershipMemberEntranceRecordList", "recordList", recordList.toString());
		
		model.addAttribute("recordList", recordList);
		
		return "branch/getMembershipMemberEntranceRecordList";
	}
}
