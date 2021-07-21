package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.QnAComment;

@Mapper
public interface CommentMapper {
	int updateQnAComment(int commentId, String commentContent);
	String selectQnAComment(int commentId);
	int deleteQnAComment(int commentId);
	int insertQnAComment(QnAComment qnaComment);
}
