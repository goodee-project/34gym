package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.BranchMember;

@Mapper
public interface BranchMemberMapper {
	List<BranchMember> selectMemberLoginByBranch(BranchMember branchMember);
}
