package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.QnA;
import com.gd.gym.vo.QnAComment;

@Mapper
public interface QnABoardMapper {
	List<QnA> selectQnAList();
	QnA selectQnAOne(int qnaId);
	int updateQnA(QnA qna);
	int deleteQnA(int qnaId);
	int insertQnA(QnA qna);
	List<QnAComment> selectQnACommentList(int qnaId);
}
