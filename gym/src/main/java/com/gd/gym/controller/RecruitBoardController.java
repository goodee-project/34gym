package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.RecruitBoardService;
import com.gd.gym.vo.Recruit;

@Controller
public class RecruitBoardController {
	@Autowired Debug debug;
	@Autowired RecruitBoardService recruitBoardService;
	
	@GetMapping("/getRecruitList")
	public String getRecruitList(Model model) {
		
		//구인게시글 가져오기
		List<Recruit> recruitList = recruitBoardService.getRecruitList();
		//디버깅
		debug.debugging("getRecruitList", "recruitList", recruitList.toString());
		
		//모델객체에 담아서 뷰에 전달
		model.addAttribute("recruitList", recruitList);
		
		return "/board/getRecruitList";
	}
}
