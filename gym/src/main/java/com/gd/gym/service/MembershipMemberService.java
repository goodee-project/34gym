package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MembershipMemberMapper;
import com.gd.gym.mapper.MembershipPriceMapper;
import com.gd.gym.vo.MembershipAmount;
import com.gd.gym.vo.MembershipMember;
import com.gd.gym.vo.MembershipMemberForm;

@Service
@Transactional
public class MembershipMemberService {
	@Autowired MembershipMemberMapper membershipMemberMapper;
	@Autowired MembershipPriceMapper membershipPriceMapper;
	@Autowired Debug de;
	
	// 운동권 구매
	public void addMembershipMember(MembershipMemberForm membershipMemberForm) {
		// 1. 운동이용권 구매
		MembershipMember membershipMember = membershipMemberForm.getMembershipMember();
		//de.debugging("addMembershipMember", "Service membershipMember", membershipMember.toString());
		membershipMemberMapper.insertMembershipMember(membershipMember);
		
		// 2. membershipMemberId에 해당하는 amount(membershipPrice) 가져오기
		int membershipPriceId = membershipMember.getMembershipPriceId();
		de.debugging("addMembershipMember", "Service membershipPriceId", membershipPriceId);
		int amount = membershipPriceMapper.selectMembershipPriceForAmount(membershipPriceId);
		de.debugging("addMembershipMember", "Service amount", amount);
		
		// 3.운동이용권 구매 가격 테이블에 입력
		int membershipMemberId = membershipMember.getMembershipMemberId();
		MembershipAmount membershipAmount = membershipMemberForm.getMembershipAmount();
		membershipAmount.setMembershipMemberId(membershipMemberId);
		membershipAmount.setAmount(amount);
		membershipMemberMapper.insertMembershipAmount(membershipAmount);
	}
	
	// 구매한 운동이용권 목록
	public List<Map<String, Object>> getMembershipByMemberList(int memberId){
		return membershipMemberMapper.selectMembershipByMemberList(memberId);
	}
}
