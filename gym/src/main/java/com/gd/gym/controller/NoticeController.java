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
import com.gd.gym.vo.Page;
import com.gd.gym.vo.QnA;

@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	@Autowired Debug de;

	// 공지사항 조회(목록)
	@GetMapping("/getNoticeList")
	public String getNoticeList(Model model,
								@RequestParam(value="pageNum", defaultValue = "0") int pageNum) {
		//매개변수 디버깅
		de.debugging("getNoticeList","pageNum", pageNum);
		
		//페이징 변수들
		int rowPerPage = 5; //페이지당 보여주는 게시글 수는 5개로 고정 (추후 필요시 수정)
		Page page = new Page();
		page.setRowPerPage(rowPerPage); 
		page.setBeginRow(pageNum * page.getRowPerPage());	
		int totalCount = noticeService.getNoticeTotal(); // 게시글 총 갯수
		
		// 서비스 호출
		List<Notice> noticeList = noticeService.getNoticeList(page);
		// 결과물 디버깅
		de.debugging("getNoticeList", "noticeList", noticeList.toString());
		
		//다음버튼 플래그 false이면 다음버튼 비활성화
		boolean nextFlag = true;
		if(totalCount <= (page.getBeginRow() + page.getRowPerPage()) ) { //총갯수가 적으면 다음버튼 비활성화
			nextFlag = false;
		}
		
		//모델객체에 담아서 뷰에 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nextFlag", nextFlag);
		model.addAttribute("noticeList", noticeList);

		return "board/getNoticeList";
	}

	// 공지사항 상세보기
	@GetMapping("/getNoticeOne")
	public String getNoticeOne(Model model,
								@RequestParam(value="noticeId", required = true) int noticeId,
								@RequestParam(value="pageNum", defaultValue = "0") int pageNum) {
		// 매개변수 디버깅
		de.debugging("getNoticeOne", "noticeId", noticeId);
		de.debugging("getNoticeOne", "pageNum", pageNum);
		
		// 서비스 호출
		Map<String, Object> noticeOne = noticeService.getNoticeOne(noticeId);
		// 결과물 디버깅
		de.debugging("getNoticeOne", "noticeOne", noticeOne.toString());
		
		model.addAttribute("noticeOne", noticeOne);
		model.addAttribute("pageNum", pageNum);
		
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
