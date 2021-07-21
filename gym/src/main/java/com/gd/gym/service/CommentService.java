package com.gd.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.CommentMapper;
import com.gd.gym.vo.QnAComment;

@Service
@Transactional
public class CommentService {
	@Autowired private Debug debug;
	@Autowired CommentMapper commentMapper;
	
	public String modifyQnAComment(int commentId, String commentContent) {
		// 매개변수 디버깅
		debug.debugging("service-modifyComment", "commentId", commentId);
		debug.debugging("service-modifyComment", "commentContent", commentContent);
		
		//댓글 업데이트
		int updateRow = commentMapper.updateQnAComment(commentId, commentContent);
		String newCommentContent = commentMapper.selectQnAComment(commentId);
		//댓글 디버깅
		debug.debugging("service-modifyComment", "newCommentContent", newCommentContent);
		
		return newCommentContent;
	}
	
	public int removeQnAComment(int commentId) {
		// 매개변수 디버깅
		debug.debugging("service-modifyComment", "commentId", commentId);
		
		//댓글 업데이트
		int deleteRow = commentMapper.deleteQnAComment(commentId);
		
		return deleteRow;
	}
	
	public int addQnAComment(QnAComment qnaComment) {
		// 매개변수 디버깅
		debug.debugging("service-addQnAComment", "qnaComment", qnaComment.toString());
		
		//댓글 추가
		int insertRow = commentMapper.insertQnAComment(qnaComment);
		
		return insertRow;
	}
}
