package com.gd.gym.restapi;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.gd.gym.debug.Debug;
import com.gd.gym.service.BuildingService;
import com.gd.gym.service.ContractService;
import com.gd.gym.vo.Building;
import com.gd.gym.vo.Contract;

@RestController
@CrossOrigin
public class PermissionRestController {
	
	@Autowired private BuildingService buildingService;
	@Autowired private ContractService contractService;
	@Autowired private Debug debug;
	
	@GetMapping("/getBuildingList")
	@ResponseBody
	public List<Building> getBuildingList(@RequestParam(value="memberId", required = true) int memberId) {
		
		// memberId 디버깅
		debug.debugging("getBuildingList", "memberId", memberId);
		
		return buildingService.getBuildingList(memberId);
	}
	
	@GetMapping("/getContractList")
	@ResponseBody
	public List<Contract> getContractList() {
		return contractService.getContractList();
	}
}
