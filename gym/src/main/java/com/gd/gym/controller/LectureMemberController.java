package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.BranchService;
import com.gd.gym.service.LectureMemberService;
import com.gd.gym.vo.Branch;
import com.gd.gym.vo.LectureMember;
import com.gd.gym.vo.LectureMemberForm;
import com.gd.gym.vo.Member;

@Controller
public class LectureMemberController {
	@Autowired Debug de;
	@Autowired BranchService branchService;
	@Autowired LectureMemberService lectureMemberService;

	@GetMapping("/getClassTimetable")
	public String getClassTimetable(Model model,
									@RequestParam(value="permissionId", defaultValue = "1") int permissionId) {
		
		// 개설강좌 가져오기
		List<Map<String, Object>> lectureTimetableList = lectureMemberService.getLectureTimetable(permissionId);
		// 지점목록 가져오기
		List<Branch> branchList = branchService.getBranchNameList();
		de.debugging("getClassTimetable", "Controller branchList", branchList.toString());

		model.addAttribute("lectureTimetableList", lectureTimetableList);
		model.addAttribute("branchList", branchList);
		return "getClassTimetable";
	}

	// 개설강좌 상세보기
	@GetMapping("/getClassTimetableOne")
	public String getClassTimetableOne(HttpSession session, Model model, 
									@RequestParam(value="lectureId", required = true) int lectureId) {
		int memberId = 0;
		Member loginMember = (Member)session.getAttribute("loginMember");
		
		// 로그인정보 담겨있으면 memberId 가공
		if(loginMember != null) {
			memberId = loginMember.getMemberId();
		}
		
		// 강좌 중복체크를 위한 세팅
		LectureMember lectureMember = new LectureMember();
		lectureMember.setMemberId(memberId);
		lectureMember.setLectureId(lectureId);
		
		// 강좌 중복체크
		int CheckLectureMember = lectureMemberService.getLectureMeberCheck(lectureMember);
		de.debugging("getClassTimetableOne", "Controller 강좌중복구매체크 0, 1", CheckLectureMember);
		// 강좌 상세보기
		Map<String, Object> classTimetableOne = lectureMemberService.getLectureTimetableOne(lectureId);
		
		model.addAttribute("CheckLectureMember", CheckLectureMember);
		model.addAttribute("classTimetableOne", classTimetableOne);
		return "/getClassTimetableOne";
	}
	
	// 회원 강좌 결제 준비
	@PostMapping("/addLectureMember")
	public String addLectureMember(LectureMemberForm lectureMemberForm) {
		
		// 결제 준비
		Map<String, Object> map = lectureMemberService.readyKakaoPay(lectureMemberForm, "http://localhost/gym/successLectureMember");
		
		// 웹이였을 경우의 url , 앱이나 모바일 웹은 다르다.
		return "redirect:" + map.get("next_redirect_pc_url");
	}
	
	// 회원 강좌 결제 성공
	@GetMapping("/successLectureMember")
	public String successLectureMember(Model model,
									@RequestParam(value="pg_token", required = true) String pg_token) {
		de.debugging("successLectureMember", "결제를 위한 토큰 token", pg_token);
		
		// 결제승인
		Map<String, Object> map = lectureMemberService.confirmKakoPay(pg_token);
		
		// 데이터 베이스에 결과 남기기
		lectureMemberService.addLectureMember();

		// 결제정보 창으로 넘겨줌
		model.addAttribute("map", map);
		model.addAttribute("itemName", map.get("item_name"));
		model.addAttribute("amount", map.get("amount"));
		return "successLectureMember";
	}
	
}
