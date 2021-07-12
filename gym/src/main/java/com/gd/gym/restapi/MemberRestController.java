package com.gd.gym.restapi;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.MemberService;

@RestController
@CrossOrigin
public class MemberRestController {
	
	@Autowired private MemberService memberService;
	@Autowired private Debug debug;
	
	@PostMapping("/getMailCheck")
	@ResponseBody
	public Integer getMailCheck(@RequestParam(value="memberMail", required = true) String memberMail) {
		
		// 디버깅
		debug.debugging("getMailCheck", "memberMail", memberMail);
		
		return memberService.getMailCheck(memberMail);
	}
}
