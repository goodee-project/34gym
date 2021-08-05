package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.QnABoardMapper;
import com.gd.gym.vo.Page;
import com.gd.gym.vo.QnA;
import com.gd.gym.vo.QnAComment;

@Service
@Transactional
public class QnABoardService {
	@Autowired QnABoardMapper qnaBoardMapper;
	@Autowired Debug debug;
	
	public List<QnA> getQnAList(Page page) {
		return qnaBoardMapper.selectQnAList(page);
	}
	public int getQnATotal() {
		return qnaBoardMapper.selectQnATotal();
	}
	public QnA getQnAOne(int qnaId) {
		return qnaBoardMapper.selectQnAOne(qnaId);
	}
	
	public int modifyQnA(QnA qna) {
		return qnaBoardMapper.updateQnA(qna);
	}
	public int deleteQnA(int qnaId) {
		return qnaBoardMapper.deleteQnA(qnaId);
	}
	public int addQnA(QnA qna) {
		return qnaBoardMapper.insertQnA(qna);
	}
	public List<QnAComment> getQnAComment(int qnaId) {
		return qnaBoardMapper.selectQnACommentList(qnaId);
	}
}
