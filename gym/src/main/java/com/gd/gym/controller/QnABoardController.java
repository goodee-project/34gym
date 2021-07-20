package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.QnABoardService;
import com.gd.gym.vo.QnA;

@Controller
public class QnABoardController {
	@Autowired QnABoardService qnaBoardService; 
	@Autowired Debug debug;
	
	@GetMapping("/getQnAList")
	public String getQnAList(Model model) {
		
		List<QnA> QnAList = qnaBoardService.getQnAList();
		debug.debugging("getQnAList", "QnAList", QnAList.toString());
		
		model.addAttribute("QnAList", QnAList);
		
		return "/board/getQnAList";
	}
}
