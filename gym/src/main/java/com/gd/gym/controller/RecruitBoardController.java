package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.RecruitBoardService;
import com.gd.gym.vo.Page;
import com.gd.gym.vo.Recruit;

@Controller
public class RecruitBoardController {
	@Autowired Debug debug;
	@Autowired RecruitBoardService recruitBoardService;
	
	@GetMapping("/getRecruitList")
	public String getRecruitList(Model model,
								@RequestParam(value="pageNum", defaultValue = "0") int pageNum) {
		
		//매개변수 디버깅
		debug.debugging("getRecruitList","pageNum", pageNum);
		
		//페이징 변수들
		int rowPerPage = 5; //페이지당 보여주는 게시글 수는 5개로 고정 (추후 필요시 수정)
		Page page = new Page();
		page.setRowPerPage(rowPerPage); 
		page.setBeginRow(pageNum * page.getRowPerPage());	
		int totalCount = recruitBoardService.getRecruitTotal(); // 게시글 총 갯수
		
		//구인게시글 가져오기
		List<Recruit> recruitList = recruitBoardService.getRecruitList(page);
		//디버깅
		debug.debugging("getRecruitList", "recruitList", recruitList.toString());
		
		//다음버튼 플래그 false이면 다음버튼 비활성화
		boolean nextFlag = true;
		if(totalCount <= (page.getBeginRow() + page.getRowPerPage()) ) { //총갯수가 적으면 다음버튼 비활성화
			nextFlag = false;
		}
		
		//모델객체에 담아서 뷰에 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nextFlag", nextFlag);
		model.addAttribute("recruitList", recruitList);
		
		return "/board/getRecruitList";
	}
	
	@GetMapping("/addRecruit")
	public String addRecruit() {	
		//뷰로 포워딩
		return "/board/addRecruit";
	}
	
	@PostMapping("/addRecruit")
	public String addRecruit(Recruit recruit) {	
		//매개변수 디버깅
		debug.debugging("addRecruit","recruit", recruit.toString());
		
		//recruit 추가 서비스 호출
		int addRow = recruitBoardService.addRecruit(recruit);
		
		//추가여부 디버깅  
		debug.debugging("Recruit","addRow", addRow);
		
		return "redirect:/getRecruitList";
	}
	
	@GetMapping("/getRecruitOne")
	public String getRecruitOne(Model model,
							@RequestParam(value="recruitId", required = true) int recruitId,
							@RequestParam(value="pageNum", defaultValue = "0") int pageNum) {
		
		//매개변수 디버깅
		debug.debugging("getRecruitOne", "recruitId", recruitId);
		debug.debugging("getRecruitOne", "pageNum", pageNum);
		
		//RecruitOne정보 가져오기
		Recruit recruitOne = recruitBoardService.getRecruitOne(recruitId);
		
		//RecruitOne 정보 디버깅
		debug.debugging("getRecruitOne", "recruitOne", recruitOne.toString());

		//모델에 담아서 뷰에 전달
		model.addAttribute("recruitOne", recruitOne);
		model.addAttribute("pageNum", pageNum);
		
		return "/board/getRecruitOne";
	}
	
	@GetMapping("/removeRecruit")
	public String removeRecruit(@RequestParam(value="recruitId", required = true) int recruitId) {
		
		//매개변수 디버깅
		debug.debugging("removeRecruit","recruitId", recruitId);
		
		//공고 삭제하기위해 서비스 호출
		int removeRow = recruitBoardService.removeRecruit(recruitId);
		
		//리뷰추가 디버깅  
		debug.debugging("removeRecruit","removeRow", removeRow);
		
		return "redirect:/getRecruitList";
	}
	@GetMapping("/modifyRecruit")
	public String modifyRecruit(Model model,
								@RequestParam(value="recruitId", required = true) int recruitId) {
		//매개변수 디버깅
		debug.debugging("modifyRecruit","recruitId", recruitId);
		
		//기존 공고 가져와서 보여주기위해 서비스 호출
		Recruit recruitOne = recruitBoardService.getRecruitOne(recruitId);
		
		//공고내용 디버깅
		debug.debugging("recruitOne", recruitOne.toString());
		
		//모델에 담아서 뷰페이지로 전달
		model.addAttribute("recruitOne", recruitOne);
		
		return "board/modifyRecruit";
	}
	@PostMapping("/modifyRecruit")
	public String modifyRecruit(Recruit recruit) {
		//매개변수 디버깅
		debug.debugging("modifyRecruit","recruit", recruit.toString());
		
		//업데이트 서비스 호출
		int modifyRow = recruitBoardService.modifyRecruit(recruit);
		
		//리뷰추가 디버깅  
		debug.debugging("modifyRecruit","modifyRow", modifyRow);
		
		//목록 리다이렉트
		return "redirect:/getRecruitOne?recruitId="+recruit.getRecruitId();
	}
}
