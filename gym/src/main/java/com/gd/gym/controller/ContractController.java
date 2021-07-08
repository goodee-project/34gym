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
import com.gd.gym.service.ContractService;
import com.gd.gym.vo.Contract;

@Controller
public class ContractController {
	@Autowired ContractService contractService;
	@Autowired Debug de;
	
	// 지점 계약조건 목록조회
	@GetMapping("/getContractList")
	public String getContractList(Model model) {
		List<Contract> contractList = contractService.getContractList();
		de.debugging("getContractList", "Controller contractList", contractList.toString());
		
		model.addAttribute("contractList", contractList);
		return "getContractList";
	}
	
	// 지점 계약조건 삭제
	@GetMapping("/removeContract")
	public String removeContract(int contractId) {
		int removeRow = contractService.removeContract(contractId);
		de.debugging("removeContract", "Controller removeRow", removeRow);
		return "redirect:/getContractList";
	}
	
	// 지점 계약조건 입력 폼
	@GetMapping("/addContract")
	public String addContract() {
		return "addContract";
	}
	// 지점 계약조건 입력 엑션
	@PostMapping("/addContract")
	public String addContract(Contract contract) {
		contractService.addContract(contract);
		de.debugging("addContract", "Controller contract", contract.toString());
		return "redirect:/getContractList";
	}
	
	// 지점 계약조건 수정 폼
	@GetMapping("/modifyContract")
	public String modifyContract(Model model,
									@RequestParam(value="contractId", required = true) int contractId) {
		Contract contractOne = contractService.getContractOne(contractId);
		de.debugging("modifyContract", "Controller contractOne", contractOne.toString());
		
		model.addAttribute("contractOne", contractOne);
		return "modifyContract";
	}
	// 지점 계약조건 수정 엑션
	@PostMapping("/modifyContract")
	public String modifyContract(Contract contract) {
		de.debugging("modifyContract", "Controller contract", contract.toString());
		contractService.modifyContract(contract);
		return "redirect:/getContractList";
	}
}
