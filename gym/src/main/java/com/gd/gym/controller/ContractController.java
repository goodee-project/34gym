package com.gd.gym.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.gd.gym.service.ContractService;
import com.gd.gym.vo.Contract;

@Controller
public class ContractController {
	@Autowired ContractService contractService;
	
	@GetMapping("/getContractList")
	public String getContractList(Model model) {
		List<Contract> contractList = contractService.getContractList();
		
		model.addAttribute("contractList", contractList);
		return "getContractList";
	}
}
