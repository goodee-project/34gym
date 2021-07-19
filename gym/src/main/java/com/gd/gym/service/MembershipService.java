package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MembershipMapper;
import com.gd.gym.vo.Membership;

@Service
@Transactional
public class MembershipService {
	@Autowired MembershipMapper membershipMapper;
	@Autowired Debug de;
	// 운동이용권 목록
	public List<Map<String, Object>> getMembershipList(){
		return membershipMapper.selectMembershipList();
	}
	
	// 운동이용권 수정
	public int modifyMembership(int membershipId) {
		int modifyRow = membershipMapper.updateMembership(membershipId);
		de.debugging("modifyMembership", "Service membershipId", membershipId);
		return modifyRow;
	}
}
