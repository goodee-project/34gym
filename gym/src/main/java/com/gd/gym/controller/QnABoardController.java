package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.QnABoardService;
import com.gd.gym.vo.Page;
import com.gd.gym.vo.QnA;
import com.gd.gym.vo.QnAComment;

@Controller
public class QnABoardController {
	@Autowired QnABoardService qnaBoardService; 
	@Autowired Debug debug;
	
	@GetMapping("/getQnAList")
	public String getQnAList(Model model,
							@RequestParam(value="pageNum", defaultValue = "0") int pageNum) {
		
		//매개변수 디버깅
		debug.debugging("getQnAList","pageNum", pageNum);
		
		//페이징 변수들
		int rowPerPage = 5; //페이지당 보여주는 게시글 수는 5개로 고정 (추후 필요시 수정)
		Page page = new Page();
		page.setRowPerPage(rowPerPage); 
		page.setBeginRow(pageNum * page.getRowPerPage());	
		int totalCount = qnaBoardService.getQnATotal(); // 게시글 총 갯수
		
		//QnA리스트 가져오는 서비스 호출
		List<QnA> QnAList = qnaBoardService.getQnAList(page);
		
		//리스트 디버깅
		debug.debugging("getQnAList", "QnAList", QnAList.toString());
		
		//다음버튼 플래그 false이면 다음버튼 비활성화
		boolean nextFlag = true;
		if(totalCount <= (page.getBeginRow() + page.getRowPerPage()) ) { //총갯수가 적으면 다음버튼 비활성화
			nextFlag = false;
		}
		
		//모델객체에 담아서 뷰에 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("nextFlag", nextFlag);
		model.addAttribute("QnAList", QnAList);
		
		return "/board/getQnAList";
	}
	
	@GetMapping("/getQnAOne")
	public String getQnAOne(Model model,
							@RequestParam(value="qnaId", required = true) int qnaId,
							@RequestParam(value="pageNum", defaultValue = "0") int pageNum) {
		
		//매개변수 디버깅
		debug.debugging("getQnAOne", "qnaId", qnaId);
		debug.debugging("getQnAOne", "pageNum", pageNum);
		
		//QnA정보 가져오기
		QnA QnAOne = qnaBoardService.getQnAOne(qnaId);
		
		//QnA 정보 디버깅
		debug.debugging("getQnAOne", "QnAOne", QnAOne.toString());
		
		//댓글리스트 서비스에 요청
		List<QnAComment> QnACommentList = qnaBoardService.getQnAComment(qnaId);
		
		//댓글리스트 디버깅
		debug.debugging("getQnAOne", "QnACommentList", QnACommentList.toString());
		
		//모델에 담아서 뷰에 전달
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("QnAOne", QnAOne);
		model.addAttribute("QnACommentList", QnACommentList);
		
		return "/board/getQnAOne";
	}
	
	@GetMapping("/modifyQnA")
	public String modifyQnA(Model model,
							@RequestParam(value="qnaId", required = true) int qnaId) {
		//매개변수 디버깅
		debug.debugging("modifyQnA", "qnaId", qnaId);
		
		//기존QnA정보 가져오기
		QnA QnAOne = qnaBoardService.getQnAOne(qnaId);
		
		//QnA 정보 디버깅
		debug.debugging("modifyQnA", "QnAOne", QnAOne.toString());
		
		//모델에 담아서 뷰에 전달
		model.addAttribute("QnAOne", QnAOne);
		
		return "/board/modifyQnA";
	}
	
	@PostMapping("/modifyQnA")
	public String modifyQnA(QnA qna) {
		//매개변수 디버깅
		debug.debugging("modifyQnA","qna", qna.toString());
		
		//업데이트 서비스 호출
		int modifyRow = qnaBoardService.modifyQnA(qna);
		
		//추가여부 디버깅  
		debug.debugging("modifyQnA","modifyRow", modifyRow);
		
		//목록 리다이렉트
		return "redirect:/getQnAOne?qnaId=" + qna.getQnaId();
	}
	
	@GetMapping("/removeQnA")
	public String removeQnA(@RequestParam(value="qnaId", required = true) int qnaId) {
		
		//매개변수 디버깅
		debug.debugging("removeQnA","qnaId", qnaId);
		
		//QnA 삭제하기위해 서비스 호출
		int removeRow = qnaBoardService.deleteQnA(qnaId);
		
		//삭제여부 디버깅  
		debug.debugging("removeQnA","removeRow", removeRow);
		
		return "redirect:/getQnAList";
	}
	
	@GetMapping("/addQnA")
	public String addQnA() {	
		//뷰로 포워딩
		return "/board/addQnA";
	}
	
	@PostMapping("/addQnA")
	public String addQnA(QnA qna) {	
		//매개변수 디버깅
		debug.debugging("addQnA","QnA", qna.toString());
		
		//QnA 추가 서비스 호출
		int addRow = qnaBoardService.addQnA(qna);
		
		//추가여부 디버깅  
		debug.debugging("addQnA","addRow", addRow);
		
		return "redirect:/getQnAList";
	}
}
