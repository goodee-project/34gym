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
import com.gd.gym.service.UniformRentalPriceService;
import com.gd.gym.vo.UniformRentalPrice;

@Controller
public class UnifromRentalPriceController {
	@Autowired UniformRentalPriceService uniformRentalPriceService;
	@Autowired Debug de;
	
	// 운동이용권 1개월 비용 조회 (목록) 맵핑
	@GetMapping("/getUniformRentalPriceList")
	public String getUniformRentalPriceList(Model model) {
		// 서비스 호출
		List<UniformRentalPrice> uniformRentalPriceList = uniformRentalPriceService.getUniformRentalPriceList();
		de.debugging("getUniformRentalPriceList", "uniformRentalPriceList", uniformRentalPriceList.toString());
		
		// model에 담기
		model.addAttribute("uniformRentalPriceList", uniformRentalPriceList);
		
		return "getUniformRentalPriceList";
	}
	
	// 운동이용권 1개월 비용 추가 맵핑
	@GetMapping("/addUniformRentalPrice")
	public String addUniformRentalPrice() {
		return "addUniformRentalPrice";
	}
	
	@PostMapping("/addUniformRentalPrice")
	public String addUniformRentalPrice(UniformRentalPrice uniformRentalPrice) {
		// 매개변수 디버깅
		de.debugging("addUniformRentalPrice", "uniformRentalPrice", uniformRentalPrice.toString());
		
		// 서비스 호출
		int addRow = uniformRentalPriceService.addUniformRentalPrice(uniformRentalPrice);
		de.debugging("addUniformRentalPrice", "addRow", addRow);
		
		return "redirect:/getUniformRentalPriceList";
	}
	
	// 운동이용권 1개월 비용 수정 맵핑
	@GetMapping("/modifyUniformRentalPrice")
	public String modifyUniformRentalPrice(Model model, @RequestParam(value="uniformRentalPriceId") int uniformRentalPriceId) {
		// 매개변수 디버깅
		de.debugging("modifyUniformRentalPrice", "uniformRentalPriceId", uniformRentalPriceId);
		
		// 서비스 호출
		Map<String, Object> uniformRentalPriceOne = uniformRentalPriceService.getUniformRentalPriceById(uniformRentalPriceId);
		de.debugging("modifyUniformRentalPrice", "uniformRentalPriceById", uniformRentalPriceOne.toString());
		
		model.addAttribute("uniformRentalPriceOne", uniformRentalPriceOne);
		return "modifyUniformRentalPrice";
	}
	
	@PostMapping("/modifyUniformRentalPrice")
	public String modifyUniformRentalPrice(UniformRentalPrice uniformRentalPrice) {
		// 매개변수 디버깅
		de.debugging("modifyUniformRentalPrice", "uniformRentalPrice", uniformRentalPrice.toString());
		
		// 서비스 호출
		int modifyRow = uniformRentalPriceService.modifyUniformRentalPrice(uniformRentalPrice);
		de.debugging("modifyUniformRentalPrice", "modifyRow", modifyRow);
		
		return "redirect:/getUniformRentalPriceList";
	}
	
	// 운동이용권 1개월 비용 삭제 맵핑
	@GetMapping("/removeUniformRentalPrice")
	public String removeUniformRentalPrice(@RequestParam(value="uniformRentalPriceId", required = true) int uniformRentalPriceId) {
		// 매개변수 디버깅
		de.debugging("removeUniformRentalPrice", "uniformRentalPriceId", uniformRentalPriceId);
		
		// 서비스 호출
		int removeRow = uniformRentalPriceService.removeUniformRentalPrice(uniformRentalPriceId);
		de.debugging("removeUniformRentalPrice", "removeRow", removeRow);
		
		return "redirect:/getUniformRentalPriceList";
	}
}
