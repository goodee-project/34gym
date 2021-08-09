package com.gd.gym.restapi;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MembershipPriceMapper;

@RestController
public class MembershipPriceRestController {
	@Autowired MembershipPriceMapper membershipPriceMapper;
	@Autowired Debug debug;
	
	@GetMapping("/getMembershipPriceForAmount")
	public Map<String, Object> getMembershipPriceForAmount(
			@RequestParam(value = "membershipPriceId") int membershipPriceId) {
		debug.debugging("membershipPriceId", membershipPriceId);

		return membershipPriceMapper.selectMembershipPriceForAmount(membershipPriceId);
	}
}
