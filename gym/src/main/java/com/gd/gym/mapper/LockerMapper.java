package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Locker;

@Mapper
public interface LockerMapper {
	int insertLocker(int insertCnt, int permissionId, String branchName);
	List<Locker> selectLockerList(int permissionId);
	int selectLockerTotalCntByBranch(int permissionId);
	int deleteLocker(int permissionId);
}
