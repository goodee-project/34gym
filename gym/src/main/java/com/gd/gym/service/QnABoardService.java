package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.QnABoardMapper;
import com.gd.gym.vo.QnA;

@Service
@Transactional
public class QnABoardService {
	@Autowired QnABoardMapper qnaBoardMapper;
	@Autowired Debug debug;
	
	public List<QnA> getQnAList() {
		return qnaBoardMapper.selectQnAList();
	}
}
