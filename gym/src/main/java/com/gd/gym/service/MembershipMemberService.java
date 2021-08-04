package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.json.JSONParser;
import org.apache.tomcat.util.json.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.MembershipMemberMapper;
import com.gd.gym.mapper.MembershipPriceMapper;
import com.gd.gym.vo.MembershipMemberForm;
import com.gd.gym.vo.MembershipAmount;
import com.gd.gym.vo.MembershipMember;

@Service
@Transactional
public class MembershipMemberService {
	@Autowired MembershipMemberMapper membershipMemberMapper;
	@Autowired MembershipPriceMapper membershipPriceMapper;
	@Autowired Debug de;
	
	private MembershipMemberForm membershipMF; //kakao 결제준비단계가 아닌 결제 승인단계에서 데이터베이스로 정보 넘기기위에 만들었습니다.
	private String tid; //kakao 결제준비 -> 결제승인으로 갈때 필요한것... (get방식이라 보내기 힘들어서 위에 만들었습니다.)
	private int amount;
	
	// 운동권 구매
	public void addMembershipMember() {
		// 1. 운동이용권 구매
		MembershipMember membershipMember = membershipMF.getMembershipMember();
		de.debugging("addMembershipMember", "Service membershipMember", membershipMember.toString());
		membershipMemberMapper.insertMembershipMember(membershipMember);
		
		// 2. membershipMemberId에 해당하는 amount(membershipPrice) 가져오기
		int membershipPriceId = membershipMember.getMembershipPriceId();
		de.debugging("addMembershipMember", "Service membershipPriceId", membershipPriceId);
		amount = membershipPriceMapper.selectMembershipPriceForAmount(membershipPriceId);
		de.debugging("addMembershipMember", "Service amount", amount);
		
		// 3.운동이용권 구매 가격 테이블에 입력
		int membershipMemberId = membershipMember.getMembershipMemberId();
		MembershipAmount membershipAmount = new MembershipAmount();
		membershipAmount.setMembershipMemberId(membershipMemberId);
		membershipAmount.setAmount(amount);
		membershipMemberMapper.insertMembershipAmount(membershipAmount);
	}
	
	// 구매한 운동이용권 목록
	public List<Map<String, Object>> getMembershipByMemberList(int memberId){
		return membershipMemberMapper.selectMembershipByMemberList(memberId);
	}
	
	// kakao 결제 준비
	public Map<String,Object> readyKakaoPay(MembershipMemberForm membershipMemberForm, String url) {
		de.debugging("readyKakaoPay", "Service membershipMemberForm", membershipMemberForm.toString());
		membershipMF = membershipMemberForm;
		
		RestTemplate rt = new RestTemplate();

		//http 헤더 생성
		HttpHeaders headers = new HttpHeaders();
		//contents-type
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		headers.add("Authorization", "KakaoAK " + "40a8071bebd081011753e6707f0ba0b0");

		//http body
		MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
		param.add("cid", "TC0ONETIME");	//가맹점 코드 - 테스트 코드
		param.add("partner_order_id", "partner_order_id");	//가맹점 주문번호
		param.add("partner_user_id", Integer.toString(membershipMemberForm.getMembershipMember().getMemberId())); // 회원
		param.add("item_name", "운동이용권");	//상품명
		param.add("quantity", "1");//상품수량
		param.add("total_amount", String.valueOf(amount)); //상품 총액
		param.add("tax_free_amount", "0"); //상품 비과세 금액
		param.add("approval_url", url);	//결제 성공 시 redirect url
		param.add("cancel_url", "http://localhost/gym/"); //결제 취소 시 redirect url
		param.add("fail_url", "http://localhost/gym/");	//결제 실패 시 redirect url

		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(param, headers);
		
		de.debugging("kakaoTokenRequest", "Service kakaoTokenRequest", kakaoTokenRequest.toString());

		ResponseEntity<String> response = rt.exchange("https://kapi.kakao.com/v1/payment/ready", HttpMethod.POST, kakaoTokenRequest, String.class);
		
		de.debugging("response 결제준비", response.toString());
		de.debugging("response bodybody 결제준비", response.getBody());
		
		Map<String, Object> kakaoResponse = null;

		try {
			kakaoResponse = new JSONParser(response.getBody()).parseObject();
		} catch (ParseException e) {
			
			e.printStackTrace();
		}
		
		de.debugging("kakaoResponse 결제준비 결과", kakaoResponse.toString());

		tid = (String)kakaoResponse.get("tid");
		de.debugging("readyKakaoPay", "Service tid", tid);
		
		return kakaoResponse;
	}
	
	// kakao 결제승인
	public Map<String, Object> confirmKakoPay(String pg_token) {

		RestTemplate rt = new RestTemplate();

		//http 헤더 생성
		HttpHeaders headers = new HttpHeaders();
		//contents-type
		headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		headers.add("Authorization", "KakaoAK " + "40a8071bebd081011753e6707f0ba0b0");

		//http body
		MultiValueMap<String, String> param = new LinkedMultiValueMap<>();
		param.add("cid", "TC0ONETIME");	//가맹점 코드 - 테스트 코드
		param.add("tid", tid);	//상품명
		param.add("partner_order_id", "partner_order_id");	//가맹점 주문번호: 결제준비 API 요청과 일치해야함
		param.add("partner_user_id", Integer.toString(membershipMF.getMembershipMember().getMemberId()));	//가맹점 회원
		param.add("pg_token", pg_token);	//pg_token

		HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(param, headers);
		
		de.debugging("kakaoTokenRequest code param", kakaoTokenRequest.toString());

		ResponseEntity<String> response = rt.exchange("https://kapi.kakao.com/v1/payment/approve", HttpMethod.POST, kakaoTokenRequest, String.class);
		
		de.debugging("response 결제승인", response.toString());
		de.debugging("response bodybody 결제승인", response.getBody());

		Map<String, Object> kakaoResponse = null;

		try {
			kakaoResponse = new JSONParser(response.getBody()).parseObject();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		de.debugging("kakaoResponse 결제승인 결과", kakaoResponse.toString());
		
		return kakaoResponse;
	}
}
