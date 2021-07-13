package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.MembershipMemberEntranceRecordMapper;
import com.gd.gym.vo.MembershipMemberEntranceRecord;

@Service
@Transactional
public class MembershipMemberEntranceRecordService {
	@Autowired MembershipMemberEntranceRecordMapper membershipMemberEntranceRecordMapper;
	
	// 운동회원 출입기록 조회(목록)
	public List<MembershipMemberEntranceRecord> getMembershipMemberEntranceRecordList() {
		return membershipMemberEntranceRecordMapper.selectMembershipMemberEntranceRecordList();
	}
}
