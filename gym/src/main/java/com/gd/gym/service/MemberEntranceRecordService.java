package com.gd.gym.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MemberEntranceRecordMapper;

@Service
@Transactional
public class MemberEntranceRecordService {
	@Autowired MemberEntranceRecordMapper memberEntranceRecordMapper;
	@Autowired Debug de;
	public List<Map<String, Object>> getMemberEntranceRecordList(int permissionId) {
		// 매개변수 디버깅
		de.debugging("getMemberEntranceRecordList", "permissionId", permissionId);
		
		// mapper 호출
		List<Map<String, Object>> tempList = memberEntranceRecordMapper.selectMemberEntranceRecordList(permissionId);
		// 디버깅
		de.debugging("getMemberEntranceRecordList", "tempList", tempList.toString());
		
		// 결과물 가공
		List<Map<String, Object>> memberEntranceRecordList = new ArrayList<>();
		for(int i=0; i<tempList.size(); i++) {
			if(tempList.get(i).get("memberType") != null && tempList.get(i).get("entranceTime") != null && tempList.get(i).get("exitTime") != null) {
				memberEntranceRecordList.add(tempList.get(i));
			}
		}
		// 디버깅
		de.debugging("getMemberEntranceRecordList", "memberEntranceRecordList", memberEntranceRecordList.toString());
		
		return memberEntranceRecordList;
	}
}
