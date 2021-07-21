package com.gd.gym.restapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.CommentService;

@RestController
@CrossOrigin
public class CommentRestController {
	@Autowired private Debug debug;
	@Autowired CommentService commentService;
	
	@GetMapping("/modifyQnAComment")
	@ResponseBody
	public String modifyQnAComment(@RequestParam(value="commentId") int commentId,
								@RequestParam(value="commentContent") String commentContent) {
		// 매개변수 디버깅
		debug.debugging("modifyComment", "commentId", commentId);
		debug.debugging("modifyComment", "commentContent", commentContent);
		
		String modifyComment = commentService.modifyQnAComment(commentId, commentContent);
		
		return modifyComment;
	}
	
	@GetMapping("/removeQnAComment")
	@ResponseBody
	public void removeQnAComment(@RequestParam(value="commentId") int commentId) {
		// 매개변수 디버깅
		debug.debugging("removeQnAComment", "commentId", commentId);
		
		int removeComment = commentService.removeQnAComment(commentId);
	}
}
