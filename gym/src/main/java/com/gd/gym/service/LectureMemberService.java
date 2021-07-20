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
import com.gd.gym.mapper.LectureMapper;
import com.gd.gym.mapper.LectureMemberMapper;
import com.gd.gym.vo.LectureAmount;
import com.gd.gym.vo.LectureMember;
import com.gd.gym.vo.LectureMemberForm;

@Service
@Transactional
public class LectureMemberService {
	@Autowired Debug de;
	@Autowired LectureMapper lectureMapper;
	@Autowired LectureMemberMapper lectureMemberMapper;
	
	private LectureMemberForm lectureMF;	//kakao 결제준비단계가 아닌 결제 승인단계에서 데이터베이스로 정보 넘기기위에 만들었습니다.
	private String tid;						//kakao 결제준비 -> 결제승인으로 갈때 필요한것... (get방식이라 보내기 힘들어서 위에 만들었습니다.)
	
	// 개설강좌 시간표만들기위한 리스트
	public List<Map<String, Object>> getLectureTimetable(int permissionId) {
		de.debugging("getLectureTimetable", "Service permissionId", permissionId);
		return lectureMapper.selectLectureTimetable(permissionId);
	}
	
	// 개설강좌 시간표 상세정보
	public Map<String, Object> getLectureTimetableOne(int lectureId) {
		de.debugging("getLectureTimetableOne", "Service lectureId", lectureId);
		return lectureMapper.selectLectureTimetableOne(lectureId);
	}
	
	// 회원 강좌구매 + 구매기록 추가
	public void addLectureMember() {
		// insertLectureMember
		LectureMember lectureMember = lectureMF.getLectureMember();
		de.debugging("addLectureMember", "Service lectureMember", lectureMember.toString());
		lectureMemberMapper.insertLectureMember(lectureMember);
		
		// 생성된 id 가져오기
		int lectureMemberId = lectureMF.getLectureMember().getLectureMemberId();
		de.debugging("addLectureMember", "Service lectureMemberId", lectureMemberId);
		
		// 가져온 Id 주입후 insert 실행
		LectureAmount lectureAmount = lectureMF.getLectureAmount();
		lectureAmount.setLectureMemberId(lectureMemberId);
		lectureMemberMapper.insertLectureAmount(lectureAmount);
	}
	
	// kakao 결제 준비
	public Map<String,Object> readyKakaoPay(LectureMemberForm lectureMemberForm, String url) {
		de.debugging("readyKakaoPay", "Service lectureMemberForm", lectureMemberForm.toString());
		lectureMF = lectureMemberForm;

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
		param.add("partner_user_id", Integer.toString(lectureMemberForm.getLectureMember().getMemberId())); // 회원
		param.add("item_name", lectureMemberForm.getLectureName());	//상품명
		param.add("quantity", "1");//상품수량
		param.add("total_amount", lectureMemberForm.getLectureAmount().getAmount()); //상품 총액
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
			// TODO Auto-generated catch block
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
		param.add("partner_user_id", Integer.toString(lectureMF.getLectureMember().getMemberId()));	//가맹점 회원
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
