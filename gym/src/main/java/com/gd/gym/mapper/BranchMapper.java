package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Branch;

@Mapper
public interface BranchMapper {
	List<Branch> selectBranchNameList();
	int updatePermissionLevel(int permissionId);
	int insertBranch(Branch branch);
}
