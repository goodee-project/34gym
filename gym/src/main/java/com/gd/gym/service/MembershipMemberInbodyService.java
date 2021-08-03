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
	
	// 트레이너가 관리하는 인바디 목록
	public List<Map<String, Object>> getMembershipMemberInbodyList(){
		return membershipMemberInbodyMapper.selectMembershipMemberInbodyList();
	}
	
	// 운동이용권 회원 인바디 입력
	public int addMembershipMemberInbody(MembershipMemberInbody membershipMemberInbody) {
		int addRow = membershipMemberInbodyMapper.insertMembershipMemberInbody(membershipMemberInbody);
		de.debugging("addMembershipMemberInbody", "Service addrow", addRow);
		return addRow;
	}
	
	// 회원이 보는 인바디 목록
	public List<Map<String, Object>> getMembershipMemberInbodyListById(int memberId){
		return membershipMemberInbodyMapper.selectMembershipMemberInbodyListById(memberId);
	}
	
	// 인바디 상세보기
	public Map<String, Object> getMembershipMemberInbodyOne(int membershipMemberInbodyId){
		return membershipMemberInbodyMapper.selectMembershipMemberInbodyOne(membershipMemberInbodyId);
	}
}
