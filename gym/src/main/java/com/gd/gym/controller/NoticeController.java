package com.gd.gym.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.NoticeService;
import com.gd.gym.vo.Admin;
import com.gd.gym.vo.Notice;

@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	@Autowired Debug de;
	
	// 공지사항 조회(목록)
	@GetMapping("/board/getNoticeList")
	public String getNoticeList(Model model) {
		
		// 서비스 호출
		List<Notice> noticeList = noticeService.getNoticeList();
		de.debugging("getNoticeList", "noticeList", noticeList.toString());
		
		model.addAttribute("noticeList", noticeList);
		
		return "board/getNoticeList";
	}
	
	// 공지사항 상세보기
	
	// 공지사항 추가
	@GetMapping("/board/addNotice")
	public String addNotice() {
		return "board/addNotice";
	}
	
	@PostMapping("/board/addNotice")
	public String addNotice(Notice notice, HttpSession session) {
		// 매개변수 디버깅
		de.debugging("addNotice", "notice", notice.toString());
		
		// 매개변수 가공
		/* 필터 구현 완료되면 쓸 부분
		 * Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
		 * de.debugging("addNotice", "loginAdmin", loginAdmin.toString()); int adminId =
		 * loginAdmin.getAdminId();
		 */
		int adminId = 1;
		
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("noticeTitle", notice.getNoticeTitle());
		paramMap.put("noticeContent", notice.getNoticeContent());
		paramMap.put("adminId", adminId);
		de.debugging("addNotice", "paramMap", paramMap.toString());
		
		// 서비스 호출
		int addRow = noticeService.addNotice(paramMap);
		de.debugging("addNotice", "addRow", addRow);
		
		return "redirect:/board/getNoticeList";
	}
	
	// 공지사항 수정
	
	
	// 공지사항 삭제
}
