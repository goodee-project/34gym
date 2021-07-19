package com.gd.gym.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.ContractService;
import com.gd.gym.vo.Contract;

@Controller
public class ContractController {
	@Autowired ContractService contractService;
	@Autowired Debug de;
	
	// 지점 계약조건 목록조회
	@GetMapping("/admin/getContractList")
	public String getContractList(Model model) {
		List<Contract> contractList = contractService.getContractList();
		de.debugging("getContractList", "Controller contractList", contractList.toString());
		
		model.addAttribute("contractList", contractList);
		return "admin/getContractList";
	}
	
	// 지점 계약조건 삭제
	@GetMapping("/admin/removeContract")
	public String removeContract(int contractId) {
		int removeRow = contractService.removeContract(contractId);
		de.debugging("removeContract", "Controller removeRow", removeRow);
		return "redirect:/admin/getContractList";
	}
	
	// 지점 계약조건 입력 폼
	@GetMapping("/admin/addContract")
	public String addContract(HttpSession session) {
		session.getAttribute("loginAdmin");
		
		return "admin/addContract";
	}
	// 지점 계약조건 입력 엑션
	@PostMapping("/admin/addContract")
	public String addContract(Contract contract) {
		contractService.addContract(contract);
		de.debugging("addContract", "Controller contract", contract.toString());
		return "redirect:/admin/getContractList";
	}
	
	// 지점 계약조건 수정 폼
	@GetMapping("/admin/modifyContract")
	public String modifyContract(HttpSession session, Model model,
									@RequestParam(value="contractId", required = true) int contractId) {
		session.getAttribute("loginAdmin");
		Contract contractOne = contractService.getContractOne(contractId);
		de.debugging("modifyContract", "Controller contractOne", contractOne.toString());
		
		model.addAttribute("contractOne", contractOne);
		return "admin/modifyContract";
	}
	// 지점 계약조건 수정 엑션
	@PostMapping("/admin/modifyContract")
	public String modifyContract(Contract contract) {
		de.debugging("modifyContract", "Controller contract", contract.toString());
		contractService.modifyContract(contract);
		return "redirect:/admin/getContractList";
	}
}
