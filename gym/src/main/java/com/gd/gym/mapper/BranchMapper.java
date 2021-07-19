package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Branch;

@Mapper
public interface BranchMapper {
	List<Branch> selectBranchNameList();
}
