package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Contract;

@Mapper
public interface ContractMapper {
	List<Contract> selectContract();						// 지점계약조건 리스트 
	Contract selectContractOne(int contractId);				// 지점계약조건 상세목록
	int insertContract(Contract contract);					// 지점계약조건 등록
	int updateContract(Contract contract);					// 지점계약조건 수정
	int deleteContract(int contractId);						// 지점계약조건 삭제
}
