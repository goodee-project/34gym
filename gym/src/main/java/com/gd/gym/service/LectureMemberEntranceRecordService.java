package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.LectureMemberEntranceRecordMapper;
import com.gd.gym.vo.LectureMemberEntranceRecord;

@Service
@Transactional
public class LectureMemberEntranceRecordService {
	@Autowired LectureMemberEntranceRecordMapper lectureMemberEntranceRecordMapper;
	
	// 강좌회원 출입기록 조회(목록)
	public List<LectureMemberEntranceRecord> getLectureMemberEntranceRecordList() {
		return lectureMemberEntranceRecordMapper.selectLectureMemberEntranceRecordList();
	}
}