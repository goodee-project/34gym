package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.RecruitBoardMapper;
import com.gd.gym.vo.Page;
import com.gd.gym.vo.Recruit;

@Service
@Transactional
public class RecruitBoardService {
	@Autowired RecruitBoardMapper recruitBoardMapper;
	
	public List<Recruit> getRecruitList(Page page) {
		return recruitBoardMapper.selectRecruitList(page);
	}
	
	public int getRecruitTotal() {
		return recruitBoardMapper.selectRecruitTotal();
	}
	
	public int addRecruit(Recruit recruit) {
		return recruitBoardMapper.insertRecruit(recruit);
	}
	
	public Recruit getRecruitOne(int recruitId) {
		return recruitBoardMapper.selectRecruitOne(recruitId);
	}
	
	public int removeRecruit(int recruitId) {
		return recruitBoardMapper.deleteRecruit(recruitId);
	}
	public int modifyRecruit(Recruit recruit) {
		return recruitBoardMapper.updateRecruit(recruit);
	}
}
