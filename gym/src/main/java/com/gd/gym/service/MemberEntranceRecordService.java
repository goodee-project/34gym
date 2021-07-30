package com.gd.gym.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MemberEntranceRecordMapper;
import com.gd.gym.vo.EntranceRecord;

@Service
@Transactional
public class MemberEntranceRecordService {
	@Autowired MemberEntranceRecordMapper memberEntranceRecordMapper;
	@Autowired Debug de;
	public Map<String, Object> getEntranceRecordList(int permissionId) {
		// 매개변수 디버깅
		de.debugging("getMemberEntranceRecordList", "permissionId", permissionId);
		
		// 서비스 호출
		// 운동회원 출입기록
		List<EntranceRecord> membershipEntranceRecordList = memberEntranceRecordMapper.selectMembershipMemberEntranceRecordList(permissionId);
		de.debugging("getEntranceRecordList", "membershipEntranceRecordList", membershipEntranceRecordList.toString());
		
		// 강좌회원 출입기록
		List<EntranceRecord> lectureEntranceRecordList = memberEntranceRecordMapper.selectLectureMemberEntranceRecordList(permissionId);
		de.debugging("getEntranceRecordList", "lectureEntranceRecordList", lectureEntranceRecordList.toString());
		
		// 운동회원 + 강좌회원 출입기록 합치기
		List<EntranceRecord> entranceRecordList = new ArrayList<>();
		entranceRecordList.addAll(membershipEntranceRecordList);
		entranceRecordList.addAll(lectureEntranceRecordList);
		de.debugging("getEntranceRecordList", "entranceRecordList", entranceRecordList.toString());
		
		Map<String, Object> allRecordList = new HashMap<>();
		allRecordList.put("membershipEntranceRecordList", membershipEntranceRecordList);
		allRecordList.put("lectureEntranceRecordList", lectureEntranceRecordList);
		allRecordList.put("entranceRecordList", entranceRecordList);
		
		return allRecordList;
	}
}
