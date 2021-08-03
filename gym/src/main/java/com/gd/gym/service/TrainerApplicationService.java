package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.TrainerApplicationMapper;

@Service
@Transactional
public class TrainerApplicationService {
	@Autowired TrainerApplicationMapper trainerApplicationMapper;
	@Autowired Debug de;
	
	// 강사지원  목록
	public List<Map<String, Object>> getTrainerApplicationList(int permissionId) {
		return trainerApplicationMapper.selectTrainerApplicationList(permissionId);
	}
	
	// 강사지원 상세보기
	public Map<String, Object> getTrainerApplicationOne(int trainerApplicationId){
		return trainerApplicationMapper.selectTrainerApplicationOne(trainerApplicationId);
	}
	
	// 강사지원 목록(회원)
	public List<Map<String, Object>> getTrainerApplicationByMemberList(int memberId){
		return trainerApplicationMapper.selectTrainerApplicationByMemberList(memberId);
	}
}
