package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.PermissionMapper;
import com.gd.gym.vo.Permission;

@Service
@Transactional
public class PermissionService {
	
	@Autowired private PermissionMapper permissionMapper;
	
	// 회원 지점신청 부분
	// permission List 서비스
	public List<Permission> getPermissionList(int memberId){
		return permissionMapper.selectPermissionList(memberId);
	}
	
	// 지점신청 서비스
	public int addPermission(Permission permission) {
		return permissionMapper.insertPermission(permission);
	}
	// 지점신청 취소 서비스
	public int removePermission(int permissionId) {
		return permissionMapper.deletePermission(permissionId);
	}
	
	// 관리자 지점신청 부분
	// 지점신청 대기 목록
	public List<Map<String, Object>> getWaitingForPermissionList() {
		return permissionMapper.selectWaitingForPermissionList();
	}
	
	// 지점신청 대기 상세조회
	public Map<String, Object> getWaitingForPermissionOne(int permissionId) {
		return permissionMapper.selectWaitingForPermissionOne(permissionId);
	}
}
