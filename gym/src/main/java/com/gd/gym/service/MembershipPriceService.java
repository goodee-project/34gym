package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.MembershipPriceMapper;
import com.gd.gym.vo.MembershipPrice;
import com.gd.gym.debug.*;

@Service
@Transactional
public class MembershipPriceService {
	@Autowired MembershipPriceMapper membershipPriceMapper;
	Debug de = new Debug();
	
	// 운동이용권 1개월 비용 조회 (목록)
	public List<MembershipPrice> getMembershipPriceList() {
		return membershipPriceMapper.selectMembershipPrice();
	}
	
	// 운동이용권 1개월 비용 등록
	public int addMembershipPrice(MembershipPrice membershipPrice) {
		// 매개변수 디버깅
		de.debugging("addMembershipPrice", "membershipPrice", membershipPrice.toString());
		return membershipPriceMapper.insertMembershipPrice(membershipPrice);
	}
	
	// 운동이용권 1개월 비용 수정
	public int modifyMembershipPrice(MembershipPrice membershipPrice) {
		// 매개변수 디버깅
		de.debugging("modifyMembershipPrice", "membershipPrice", membershipPrice.toString());
		return membershipPriceMapper.updateMembershipPrice(membershipPrice);
	}
	
	// 운동이용권 1개월 비용 삭제
	public int removeMembershipPrice(int membershipPriceId) {
		// 매개변수 디버깅
		de.debugging("removeMembershipPrice", "membershipPriceId", membershipPriceId);
		return membershipPriceMapper.deleteMembershipPrice(membershipPriceId);
	}
}
