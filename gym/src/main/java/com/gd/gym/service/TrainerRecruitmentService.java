package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.TrainerRecruitmentMapper;
import com.gd.gym.vo.TrainerRecruitment;

@Service
@Transactional
public class TrainerRecruitmentService {
	@Autowired TrainerRecruitmentMapper trainerRecruitmentMapper;
	@Autowired Debug de;
	
	// 트레이너 목록
	public List<Map<String, Object>> getTrainerRecruitmentList(){
		return trainerRecruitmentMapper.selectTrainerRecruitmentList();
	}
	
	// 트레이너 수정
	public int modifyTrainerRecruitment(TrainerRecruitment trainerRecruitment) {
		int modifyRow = trainerRecruitmentMapper.updateTrainerRecruitment(trainerRecruitment);
		de.debugging("modifyTrainerRecruitment", "Service modifyRow", trainerRecruitment.toString());
		return modifyRow;
	}
	
	// 강사채용 수정 시 기존 정보 가져오기
	public Map<String, Object> getTrainerRecruitmentById(int trainerApplicationId) {
		return trainerRecruitmentMapper.selectTrainerRecruitmentById(trainerApplicationId);
	}
		
	// 트레이너 삭제
	public int removeTrainerRecruitment(int trainerApplicationId) {
		de.debugging("removeTrainerRecruitment", "Service trainerApplicationId", trainerApplicationId);
		
		int removeRow = trainerRecruitmentMapper.deleteTrainerRecruitment(trainerApplicationId);
		de.debugging("removeTrainerRecruitment", "Service removeRow", removeRow);
		return removeRow;
	}
	
	// 트레이너 상세보기
	public Map<String, Object> getTrainerRecruitmentOne(Integer trainerApplicationId){
		de.debugging("getTrainerRecruitmentOne", "Service trainerApplicationId", trainerApplicationId);
		
		return trainerRecruitmentMapper.selectTrainerRecruitmentOne(trainerApplicationId);
	}
}
