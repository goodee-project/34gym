package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.BranchMember;

@Mapper
public interface BranchMemberMapper {
	BranchMember selectMemberLoginByBranch(BranchMember branchMember);
}
