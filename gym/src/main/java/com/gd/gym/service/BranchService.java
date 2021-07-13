package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.BranchMapper;
import com.gd.gym.vo.Branch;

@Service
@Transactional
public class BranchService {
	@Autowired BranchMapper branchMapper;
	@Autowired Debug de;
	
	// 지점장 id 목록
	public List<Branch> getBranchList() {
		return branchMapper.selectBranchList();
	}
}
