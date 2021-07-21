package com.gd.gym.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.CommentService;
import com.gd.gym.vo.QnAComment;

@Controller
public class CommentController {
	@Autowired private Debug debug;
	@Autowired CommentService commentService;
	
	@PostMapping("/addQnAComment")
	public String addQnAComment(QnAComment qnaComment) {
		//매개변수 디버깅
		debug.debugging("addQnAComment","qnaComment", qnaComment.toString());
		
		//리뷰 추가 여부
		int addRow = commentService.addQnAComment(qnaComment);
		
		//리뷰추가 디버깅
		debug.debugging("addQnAComment","addRow", addRow);
		
		return "redirect:/getQnAOne?qnaId="+qnaComment.getQnaId();
	}
}
