package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MembershipMapper;

@Service
@Transactional
public class MembershipService {
	@Autowired MembershipMapper membershipMapper;
	@Autowired Debug de;
	
	public List<Map<String, Object>> getMembershipList(){
		return membershipMapper.selectMembershipList();
	}
}
