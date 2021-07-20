package com.gd.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MembershipMemberMapper;
import com.gd.gym.vo.MembershipMember;

@Service
@Transactional
public class MembershipMemberService {
	@Autowired MembershipMemberMapper membershipMemberMapper;
	@Autowired Debug de;
	
	// 운동권 구매
	public int addMembershipMember(MembershipMember membershipMember) {
		de.debugging("addMembershipMember", "Service membershipMember", membershipMember.toString());
		
		int addRow = membershipMemberMapper.insertMembershipMember(membershipMember);
		de.debugging("addMembershipMember", "Service addrow", addRow);
		return addRow;
	}
}
