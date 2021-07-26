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
	public List<Branch> getBranchNameList() {
		return branchMapper.selectBranchNameList();
	}
	
	// 관리자 지점 허가
	public int addBranch(Branch branch) {
		// 매개변수 디버깅
		de.debugging("addBranch", "branch", branch.toString());
		
		// 매개변수 가공
		int permissionId = branch.getPermissionId();
		de.debugging("addBranch", "permissionId", permissionId);
		
		// permission 테이블의 permission_level 업데이트
		int updateRow = branchMapper.updatePermissionLevel(permissionId);
		
		// Branch 테이블에 허가된 지점 정보 추가
		int addRow = branchMapper.insertBranch(branch);
		
		return updateRow+addRow; // Row 값이 2일 경우에 지점 허가 완료
	}
}
