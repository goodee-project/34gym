package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.RecruitBoardMapper;
import com.gd.gym.vo.Recruit;

@Service
@Transactional
public class RecruitBoardService {
	@Autowired RecruitBoardMapper recruitBoardMapper;
	
	public List<Recruit> getRecruitList() {
		return recruitBoardMapper.selectRecruitList();
	}
}
