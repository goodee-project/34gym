package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MembershipMemberInbodyMapper;
import com.gd.gym.vo.MembershipMemberInbody;

@Service
@Transactional
public class MembershipMemberInbodyService {
	@Autowired MembershipMemberInbodyMapper membershipMemberInbodyMapper;
	@Autowired Debug de;
	
	// 운동이용권 회원 인바디 입력
	public int addMembershipMemberInbody(MembershipMemberInbody membershipMemberInbody) {
		int addRow = membershipMemberInbodyMapper.insertMembershipMemberInbody(membershipMemberInbody);
		de.debugging("addMembershipMemberInbody", "Service addrow", addRow);
		return addRow;
	}
	
	// 운동이용권 회원 인바디 목록
	public List<Map<String, Object>> getMembershipMemberInbodyList(int memberId){
		return membershipMemberInbodyMapper.selectMembershipMemberInbodyList(memberId);
	}
}
