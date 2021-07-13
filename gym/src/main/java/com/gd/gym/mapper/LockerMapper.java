package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Locker;

@Mapper
public interface LockerMapper {
	int insertLockerByBranch(int count, int permissionId, String branchName);
	List<Locker> selectLockerList();
}
