package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.ContractMapper;
import com.gd.gym.vo.Contract;

@Service
@Transactional
public class ContractService {
	@Autowired ContractMapper contractMapper;
	@Autowired Debug de;
	
	// 지점 계약조건 목록
	public List<Contract> getContractList(){
		return contractMapper.selectContract();
	}
	
	// 지점 계약조건 입력
	public int addContract(Contract contract) {
		int addRow = contractMapper.insertContract(contract);
		de.debugging("addContract", "Service addrow",addRow);
		return addRow;
	}
	// 지점 계약조건 삭제
	public int removeContract(int contractId) {
		int removeRow = contractMapper.deleteContract(contractId);
		de.debugging("removeContract", "Service removeRow",removeRow);
		return removeRow;
	}
	
	// 지점 계약조건 수정
	public int modifyContract(Contract contract) {
		int modifyRow = contractMapper.updateContract(contract);
		de.debugging("modifyContract", "Service modifyRow",modifyRow);
		return modifyRow;
	}
	
	// 지점 계약조건 상세목록
	public Contract getContractOne(int contractId) {
		return contractMapper.selectContractOne(contractId);
	}
}
