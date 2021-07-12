package com.gd.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.MemberMapper;
import com.gd.gym.vo.Member;

@Service // 붙어있어야 객체가 만들어짐
@Transactional // spring에 트랜잭션기능이 있다. 어떤 메서드를 실행하다가 에러가뜨면 그 메서드가 있는 서비스 롤백
public class MemberService {
	
	// spring에는 Mapper에 객체 주입하는 기능이 있음(의존성 주입 = Dependency Injection)
	@Autowired private MemberMapper memberMapper;
	
	// addMember(멤버 추가하는 메서드)
	public int addMember(Member member) {
		return memberMapper.insertMember(member);
	}
	
	// memberLogin(멤버 로그인)
	public Member memberLogin(Member member) {
		return memberMapper.selectMemberLogin(member);
	}
	
	// getmailCheck(아이디 중복 확인)
	public int getMailCheck(String memberMail) {
		return memberMapper.selectMailCheck(memberMail);
	}
}
