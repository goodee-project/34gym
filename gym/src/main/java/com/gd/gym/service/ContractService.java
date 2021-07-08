package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.ContractMapper;
import com.gd.gym.vo.Contract;

@Service
public class ContractService {
	@Autowired ContractMapper contractMapper;
	// 디버깅
	Debug de = new Debug();
	
	// 지점 계약조건 목록
	public List<Contract> getContractList(){
		return contractMapper.selectContract();
	}
	
	// 지점 계약조건 입력
	public int addContract(Contract contract) {
		int addRow = contractMapper.insertContrack(contract);
		de.debugging("addContract", "addrow",addRow);
		return addRow;
	}
	// 지점 계약조건 삭제
	public int removeContract(int contractId) {
		int removeRow = contractMapper.deleteContrack(contractId);
		de.debugging("removeContract", "removeRow",removeRow);
		return removeRow;
	}
	
	// 지점 계약조건 수정
}
