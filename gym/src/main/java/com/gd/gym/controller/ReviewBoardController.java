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
	
	@GetMapping("/addReview")
	public String addReview(Model model, HttpSession session) {
		//강좌회원세션에서 정보 가져오기
		List<CurrentLectureMember> Lectureinfo = (ArrayList<CurrentLectureMember>)session.getAttribute("Lectureinfo");
		
		int memberId = Lectureinfo.get(0).getMemberId();
		String memberName = Lectureinfo.get(0).getMemberName();
		List<String> lectureName = new ArrayList<>();
		for(CurrentLectureMember l : Lectureinfo) {
			lectureName.add(l.getLectureName());
		}
		
		debug.debugging("addReview", "Lectureinfo", Lectureinfo.toString());
		
		//모델에 담아서 뷰페이지로 전달
		model.addAttribute("Lectureinfo",Lectureinfo);
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
		return "redirect:/getReviewList";
	}
}
