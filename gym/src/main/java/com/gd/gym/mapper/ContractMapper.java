package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Contract;

@Mapper
public interface ContractMapper {
	List<Contract> selectContract();
	int insertContrack(Contract contract);
	int updateContrack(Contract contract);
	int deleteContrack(int contractId);
}
