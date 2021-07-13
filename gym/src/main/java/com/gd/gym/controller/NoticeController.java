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
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.NoticeService;
import com.gd.gym.vo.Admin;
import com.gd.gym.vo.Notice;

@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	@Autowired Debug de;

	// 공지사항 조회(목록)
	@GetMapping("/getNoticeList")
	public String getNoticeList(Model model) {

		// 서비스 호출
		List<Notice> noticeList = noticeService.getNoticeList();
		// 결과물 디버깅
		de.debugging("getNoticeList", "noticeList", noticeList.toString());

		model.addAttribute("noticeList", noticeList);

		return "board/getNoticeList";
	}

	// 공지사항 상세보기
	@GetMapping("/getNoticeOne")
	public String getNoticeOne(Model model,
								@RequestParam(value="noticeId", required = true) int noticeId) {
		// 매개변수 디버깅
		de.debugging("getNoticeOne", "noticeId", noticeId);
		
		// 서비스 호출
		Map<String, Object> noticeOne = noticeService.getNoticeOne(noticeId);
		// 결과물 디버깅
		de.debugging("getNoticeOne", "noticeOne", noticeOne.toString());
		
		model.addAttribute("noticeOne", noticeOne);
		
		return "board/getNoticeOne";
	}

	// 공지사항 추가 폼
	@GetMapping("/admin/addNotice")
	public String addNotice() {
		return "board/addNotice";
	}

	// 공지사항 추가 액션
	@PostMapping("/admin/addNotice")
	public String addNotice(Notice notice, HttpSession session) {
		// 매개변수 디버깅
		de.debugging("addNotice", "notice", notice.toString());

		// 매개변수 가공
		//필터 구현 완료되면 쓸 부분 
		  Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
		  de.debugging("addNotice", "loginAdmin", loginAdmin.toString()); 
		  int adminId = loginAdmin.getAdminId();
		 
			/* int adminId = 1; */

		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("noticeTitle", notice.getNoticeTitle());
		paramMap.put("noticeContent", notice.getNoticeContent());
		paramMap.put("adminId", adminId);
		// paramMap 값 확인 디버깅
		de.debugging("addNotice", "paramMap", paramMap.toString());

		// 서비스 호출
		int addRow = noticeService.addNotice(paramMap);
		// 추가 확인 디버깅
		de.debugging("addNotice", "addRow", addRow);

		return "redirect:/getNoticeList";
	}

	
	  // 공지사항 수정 폼
	  @GetMapping("/admin/modifyNotice") 
	  public String modifyNotice(Model model,
			  					@RequestParam(value="noticeId", required = true) int noticeId) {
		// 매개변수 디버깅
		de.debugging("removeNotice", "noticeId", noticeId);
		
		// 공지사항 기존 내용 가져오기
		Map<String, Object> noticeOne = noticeService.getNoticeOne(noticeId);
		// 결과값 디버깅
		de.debugging("getNoticeOne", "noticeOne", noticeOne.toString());
		
		model.addAttribute("noticeOne", noticeOne);
		 
		return "board/modifyNotice";
	  }
	  
	  // 공지사항 수정 액션
	  @PostMapping("/admin/modifyNotice") 
	  public String modifyNotice(Notice notice) {
		  // 매개변수 디버깅
		  de.debugging("modifyNotice", "notice", notice.toString());
		  
		  // 서비스 호출
		  int modifyRow = noticeService.modifyNotice(notice);
		  // 수정 확인 디버깅
		  de.debugging("modifyNotice", "modifyRow", modifyRow);
		  
		  return "redirect:/getNoticeOne?noticeId="+notice.getNoticeId();
	  }

	// 공지사항 삭제 액션
	@GetMapping("/admin/removeNotice")
	public String removeNotice(@RequestParam(value="noticeId", required = true) int noticeId) {
		// 매개변수 디버깅
		de.debugging("removeNotice", "noticeId", noticeId);
		
		// 서비스 호출
		int removeRow = noticeService.removeNotice(noticeId);
		// 삭제 확인 디버깅
		de.debugging("removeNotice", "removeRow", removeRow);
		
		return "redirect:/getNoticeList";
	}
}
