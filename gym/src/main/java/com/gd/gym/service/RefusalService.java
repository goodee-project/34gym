package com.gd.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.RefusalMapper;
import com.gd.gym.vo.Refusal;

@Service
@Transactional
public class RefusalService {
	@Autowired Debug de;
	@Autowired RefusalMapper refusalMapper;
	
	public int addRefusal(Refusal refusal) {
		// 매개변수 디버깅
		de.debugging("addRefusal", "refusal", refusal.toString());
		
		// 매개변수 가공
		int permissionId = refusal.getPermissionId();
		de.debugging("addRefusal", "permissionId", permissionId);
		
		// permission 테이블의 permission_level 업데이트
		int updateRow = refusalMapper.updatePermissionLevel(permissionId);
		
		// refusal 테이블에 거부된 지점 추가
		int addRow = refusalMapper.insertRefusal(refusal);
		
		return updateRow+addRow;
	}
}
