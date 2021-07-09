package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.LockerRentalPriceService;
import com.gd.gym.vo.LockerRentalPrice;

@Controller
public class LockerRentalPriceController {
	@Autowired LockerRentalPriceService lockerRentalPriceService;
	@Autowired Debug de;
	
	// 라커 1개월 비용 조회 (목록) 맵핑
	@GetMapping("/getLockerRentalPriceList")
	public String getLockerRentalPriceList(Model model) {
		// 서비스 호출
		List<LockerRentalPrice> lockerRentalPriceList = lockerRentalPriceService.getLockerRentalPriceList();
		de.debugging("getLockerRentalPriceList", "lockerRentalPriceList", lockerRentalPriceList.toString());
		
		// model에 담기
		model.addAttribute("lockerRentalPriceList", lockerRentalPriceList);
		
		return "getLockerRentalPriceList";
	}
	
	// 라커 1개월 비용 추가 맵핑
	@GetMapping("/addLockerRentalPrice")
	public String addLockerRentalPrice() {
		return "addLockerRentalPrice";
	}
	
	@PostMapping("/addLockerRentalPrice")
	public String addLockerRentalPrice(LockerRentalPrice lockerRentalPrice) {
		// 매개변수 디버깅
		de.debugging("addLockerRentalPrice", "lockerRentalPrice", lockerRentalPrice.toString());
		
		// 서비스 호출
		int addRow = lockerRentalPriceService.addLockerRentalPrice(lockerRentalPrice);
		de.debugging("addLockerRentalPrice", "addRow", addRow);
		
		return "redirect:/getLockerRentalPriceList";
	}
	
	// 라커 1개월 비용 수정 맵핑
	@GetMapping("/modifyLockerRentalPrice")
	public String modifyLockerRentalPrice(Model model, @RequestParam(value="lockerRentalPriceId") int lockerRentalPriceId) {
		// 매개변수 디버깅
		de.debugging("modifyLockerRentalPrice", "lockerRentalPriceId", lockerRentalPriceId);
		
		// 서비스 호출
		Map<String, Object> lockerRentalPriceOne = lockerRentalPriceService.getLockerRentalPriceById(lockerRentalPriceId);
		de.debugging("modifyLockerRentalPrice", "lockerRentalPriceOne", lockerRentalPriceOne.toString());
		
		model.addAttribute("lockerRentalPriceOne", lockerRentalPriceOne);
		return "modifyLockerRentalPrice";
	}
	
	@PostMapping("/modifyLockerRentalPrice")
	public String modifyLockerRentalPrice(LockerRentalPrice lockerRentalPrice) {
		// 매개변수 디버깅
		de.debugging("modifyLockerRentalPrice", "lockerRentalPrice", lockerRentalPrice.toString());
		
		// 서비스 호출
		int modifyRow = lockerRentalPriceService.modifyLockerRentalPrice(lockerRentalPrice);
		de.debugging("modifyLockerRentalPrice", "modifyRow", modifyRow);
		
		return "redirect:/getLockerRentalPriceList";
	}
	
	// 라커 1개월 비용 삭제 맵핑
	@GetMapping("/removeLockerRentalPrice")
	public String removeLockerRentalPrice(@RequestParam(value="lockerRentalPriceId", required = true) int lockerRentalPriceId) {
		// 매개변수 디버깅
		de.debugging("removeLockerRentalPrice", "lockerRentalPriceId", lockerRentalPriceId);
		
		// 서비스 호출
		int removeRow = lockerRentalPriceService.removeLockerRentalPrice(lockerRentalPriceId);
		de.debugging("removeLockerRentalPrice", "removeRow", removeRow);
		
		return "redirect:/getLockerRentalPriceList";
	}
}
