package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.LockerMapper;
import com.gd.gym.vo.Locker;

@Service
@Transactional
public class LockerService {
	@Autowired Debug de;
	@Autowired LockerMapper lockerMapper;
	
	// 지점별 라커등록 
	public void addLockerByBranch(int count, int permissionId, String branchName) {
		int lockerBranchTotal = 0;
		// count 횟수만큼 반복해서 락커추가
		for(int i=lockerBranchTotal+1; i<count+1; i++) {
			lockerMapper.insertLockerByBranch(count, permissionId, branchName);
		}	
	}
	
	// 락커 목록
	public List<Locker> getLockerList() {
		return lockerMapper.selectLockerList();
	}
}
