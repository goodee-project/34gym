package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.TrainerMapper;
import com.gd.gym.vo.TrainerRecruitment;

@Service
@Transactional
public class TrainerService {
	@Autowired TrainerMapper trainerMapper;
	@Autowired Debug de;
	
	// 트레이너 목록
	public List<TrainerRecruitment> getTrainerRecruitmentList(){
		return trainerMapper.selectTrainerRecruitmentList();
	}
	
	// 트레이너 수정
	public int modifyTrainerRecruitment(TrainerRecruitment trainerRecruitment) {
		int modifyRow = trainerMapper.updateTrainerRecruitment(trainerRecruitment);
		de.debugging("modifyTrainerRecruitment", "Service modifyRow", trainerRecruitment.toString());
		return modifyRow;
	}
		
	// 트레이너 삭제
	public int removeTrainerRecruitment(int trainerApplicationId) {
		de.debugging("removeTrainerRecruitment", "Service trainerApplicationId", trainerApplicationId);
		
		int removeRow = trainerMapper.deleteTrainerRecruitment(trainerApplicationId);
		de.debugging("removeTrainerRecruitment", "Service removeRow", removeRow);
		return removeRow;
	}
}
