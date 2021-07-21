package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.PermissionMapper;
import com.gd.gym.vo.Permission;

@Service
@Transactional
public class PermissionService {
	
	@Autowired private PermissionMapper permissionMapper;
	
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
}
