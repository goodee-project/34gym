package com.gd.gym.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MemberEntranceRecordService;
import com.gd.gym.vo.BranchMember;
import com.gd.gym.vo.EntranceRecord;

@Controller
public class MemberEntranceRecordController {
	@Autowired Debug de;
	@Autowired MemberEntranceRecordService memberEntranceRecordService;
	
	// 출입기록 조회(목록) 맵핑
	@GetMapping("/branch/getMemberEntranceRecordList")
	public String getMemberEntranceRecordList(Model model, HttpSession session, @RequestParam(value="memberType", required = false, defaultValue = "0") int memberType) {
		// 매개변수 가공
		BranchMember loginBranch = (BranchMember)session.getAttribute("loginBranch");
		// 디버깅
		de.debugging("getMemberEntranceRecordList", "loginBranch", loginBranch.toString());
		// 세션에 있는 permissionId 가공
		int permissionId = loginBranch.getPermissionId();
		// 디버깅
		de.debugging("getMemberEntranceRecordList", "permissionId", permissionId);
		
		// 서비스 호출
		Map<String, Object> allRecordList = memberEntranceRecordService.getEntranceRecordList(permissionId);
		// 결과물 디버깅
		de.debugging("getMembershipMemberEntranceRecordList", "allRecordList", allRecordList.toString());
		
		// 전체 목록 보여주기
		if(memberType == 0) {
			model.addAttribute("entranceRecordList", allRecordList.get("entranceRecordList"));
		} else if(memberType == 1) { // 운동 회원 선택 했을 때
			model.addAttribute("membershipEntranceRecordList", allRecordList.get("membershipEntranceRecordList"));
		} else if(memberType == 2) { // 강좌 회원 선택 했을 때
			model.addAttribute("lectureEntranceRecordList", allRecordList.get("lectureEntranceRecordList"));
		}
		model.addAttribute("memberType", memberType);
		return "branch/getMemberEntranceRecordList";
	}
}
