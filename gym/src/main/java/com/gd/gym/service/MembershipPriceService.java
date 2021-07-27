package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MembershipPriceMapper;
import com.gd.gym.vo.MembershipPrice;

@Service
@Transactional
public class MembershipPriceService {
	@Autowired MembershipPriceMapper membershipPriceMapper;
	@Autowired Debug de;
	
	// 운동이용권 1개월 비용 조회 (목록)
	public List<MembershipPrice> getMembershipPriceList() {
		return membershipPriceMapper.selectMembershipPrice();
	}
	
	// 운동이용권 비용 등록
	public int addMembershipPrice(MembershipPrice membershipPrice) {
		// 매개변수 디버깅
		de.debugging("addMembershipPrice", "membershipPrice", membershipPrice.toString());
		return membershipPriceMapper.insertMembershipPrice(membershipPrice);
	}
	
	// 운동이용권 비용 수정
	public int modifyMembershipPrice(MembershipPrice membershipPrice) {
		// 매개변수 디버깅
		de.debugging("modifyMembershipPrice", "membershipPrice", membershipPrice.toString());
		return membershipPriceMapper.updateMembershipPrice(membershipPrice);
	}
	
	// 운동이용권 비용 수정 시 기존 정보 가져오기
	public Map<String, Object> getMembershipPriceById(int membershipPriceId) {
		// 매개변수 디버깅
		de.debugging("getMembershipPriceById", "membershipPriceId", membershipPriceId);
		return membershipPriceMapper.selectMembershipPriceById(membershipPriceId);
	}
	
	// 운동이용권 비용 삭제
	public int removeMembershipPrice(int membershipPriceId) {
		// 매개변수 디버깅
		de.debugging("removeMembershipPrice", "membershipPriceId", membershipPriceId);
		return membershipPriceMapper.deleteMembershipPrice(membershipPriceId);
	}
	
	// 운동이용권 이름 목록
	public List<MembershipPrice> getMembershipNameListbyId() {
		return membershipPriceMapper.selectMembershipNameListbyId();
	}
}
