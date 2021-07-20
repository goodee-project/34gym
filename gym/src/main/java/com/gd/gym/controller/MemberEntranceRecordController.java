package com.gd.gym.controller;

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

@Controller
public class MemberEntranceRecordController {
	@Autowired Debug de;
	@Autowired MemberEntranceRecordService memberEntranceRecordService;
	
	// 운동회원 출입기록 조회(목록) 맵핑
	@GetMapping("/branch/getMemberEntranceRecordList")
	public String getMemberEntranceRecordList(Model model, HttpSession session, @RequestParam(value="memberType", required = false) String memberType) {
		// 매개변수 디버깅
		de.debugging("getMemberEntranceRecordList", "memberType", memberType);
		
		// 매개변수 가공
		BranchMember loginBranch = (BranchMember)session.getAttribute("loginBranch");
		// 디버깅
		de.debugging("getMemberEntranceRecordList", "loginBranch", loginBranch.toString());
		// 세션에 있는 permissionId 가공
		int permissionId = loginBranch.getPermissionId();
		// 디버깅
		de.debugging("getMemberEntranceRecordList", "permissionId", permissionId);
		
		// 서비스 호출
		List<Map<String, Object>> recordList = memberEntranceRecordService.getMemberEntranceRecordList(permissionId);
		// 결과물 디버깅
		de.debugging("getMembershipMemberEntranceRecordList", "recordList", recordList.toString());
		
		/*
		 * // 뷰에서 memberType option을 선택했을 경우 if(memberType != null) {
		 * if(memberType.equals("membership")) { // 운동회원이라면 for(int i=0;
		 * i<recordList.size(); i++) {
		 * if(recordList.get(i).get("memberType").equals("운동회원")) {
		 * recordList.add(recordList.get(i)); } } } else { // 강좌회원이라면 for(int i=0;
		 * i<recordList.size(); i++) {
		 * if(recordList.get(i).get("memberType").equals("강좌회원")) {
		 * recordList.add(recordList.get(i)); } } } }
		 */
		
		// 가공 후 결과물 디버깅
		de.debugging("getMembershipMemberEntranceRecordList", "가공된 recordList", recordList.toString());
		
		model.addAttribute("recordList", recordList);
		
		return "branch/getMemberEntranceRecordList";
	}
}
