package com.gd.gym.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.ReviewBoardService;
import com.gd.gym.vo.CurrentLectureMember;
import com.gd.gym.vo.Review;

@Controller
public class ReviewBoardController {
	@Autowired ReviewBoardService reviewBoardService;
	@Autowired private Debug debug;
	
	@GetMapping("/getReviewList")
	public String getReviewList(Model model) {
		//리뷰리스트 가져오기위해 서비스 호출
		List<Map<String, Object>> reviewList = reviewBoardService.getReviewList();
		
		//리뷰 리스트 디버깅
		debug.debugging("getReviewList", reviewList.size());
		
		//모델에 담아서 뷰페이지로 전달
		model.addAttribute("reviewList", reviewList);
		
		return "board/getReviewList";
	}
	
	@GetMapping("/getReviewOne")
	public String getReviewOne(Model model, 
								@RequestParam(value="reviewId", required = true) int reviewId) {
		//매개변수 디버깅
		debug.debugging("getReviewOne", reviewId);
		
		//리뷰 상세내용 가져오기위해 서비스 호출
		Map<String, Object> reviewOne = reviewBoardService.getReviewOne(reviewId);
		
		//리뷰 상세내용 디버깅
		debug.debugging("getReviewOne", reviewOne.toString());
		
		//모델에 담아서 뷰페이지로 전달
		model.addAttribute("reviewOne", reviewOne);
		
		return "board/getReviewOne";
	}
	
	@GetMapping("/addReview") //세션이 없다면 접근할수없도록 필터 적용해야됨.
	public String addReview(Model model, HttpSession session) {
		//강좌회원세션에서 정보 가져오기 세션에 담을때 리스트를 오브젝트로 변환하여 담기때문에 원하는 타입으로 변환해줘야됨.
		//List<CurrentLectureMember> lectureInfo = (ArrayList<CurrentLectureMember>)session.getAttribute("lectureInfo"); //Type safety: Unchecked cast from Object to ArrayList<CurrentLectureMember>발생
		List<CurrentLectureMember> lectureInfo = new ArrayList<>(); //세션정보 담을 리스트
		if(session.getAttribute("lectureInfo") instanceof List<?>) { //제네릭타입이 뭔지 모르지만 리스트 객체라면
			List<?> list = (List<?>)session.getAttribute("lectureInfo"); // 리스트로 선언
			for (Object item : list) { //리스트를 오브젝트타입으로 반복문 접근
				if(item instanceof CurrentLectureMember) { //요소가 CurrentLectureMember객채라면
					lectureInfo.add((CurrentLectureMember)item); // 변화하여 사용할 리스트에 추가
				}
			}
		}
		debug.debugging("addReview", "Lectureinfo", lectureInfo.toString());
		//여기선 모든 정보가 필요하지않아서 첫 요소 만 가져옴
		int memberId = lectureInfo.get(0).getMemberId();
		String memberName = lectureInfo.get(0).getMemberName();
		
		
		
		//모델에 담아서 뷰페이지로 전달
		model.addAttribute("lectureInfo",lectureInfo);
		model.addAttribute("memberId",memberId);
		model.addAttribute("memberName",memberName);
		
		return "board/addReview";
	}
	@PostMapping("/addReview")
	public String addReview(Review review) {
		//매개변수 디버깅
		debug.debugging("addReview","review", review.toString());
		
		//리뷰 추가 여부
		int addRow = reviewBoardService.addReview(review);
		
		//리뷰추가 디버깅
		debug.debugging("addReview","addRow", addRow);
		
		return "redirect:/getReviewList";
	}
	@GetMapping("/modifyReview")
	public String modifyReview(Model model,
								@RequestParam(value="reviewId", required = true) int reviewId) {
		//매개변수 디버깅
		debug.debugging("modifyReview","reviewId", reviewId);
		
		//기존 리뷰 가져와서 보여주기위해 서비스 호출
		Map<String, Object> reviewOne = reviewBoardService.getReviewOne(reviewId);
		
		//리뷰내용 디버깅
		debug.debugging("getReviewOne", reviewOne.toString());
		
		//모델에 담아서 뷰페이지로 전달
		model.addAttribute("reviewOne", reviewOne);
		
		return "board/modifyReview";
	}
	@PostMapping("/modifyReview")
	public String modifyReview(Review review) {
		//매개변수 디버깅
		debug.debugging("modifyReview","review", review.toString());
		
		//업데이트 서비스 호출
		int modifyRow = reviewBoardService.modifyReview(review);
		
		//리뷰추가 디버깅  
		debug.debugging("modifyReview","modifyRow", modifyRow);
		
		//목록 리다이렉트
		return "redirect:/getReviewOne?reviewId="+review.getReviewId();
	}
	
	@PostMapping("/removeReview")
	public String removeReview(@RequestParam(value="reviewId", required = true) int reviewId) {
		
		//매개변수 디버깅
		debug.debugging("removeReview","reviewId", reviewId);
		
		//리뷰 삭제하기위해 서비스 호출
		int removeRow = reviewBoardService.removeReview(reviewId);
		
		//리뷰추가 디버깅  
		debug.debugging("removeReview","removeRow", removeRow);
		
		return "redirect:/getReviewList";
	}
	
}
