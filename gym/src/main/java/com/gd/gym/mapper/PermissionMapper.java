package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Permission;

@Mapper
public interface PermissionMapper {
	List<Permission> selectPermissionList(int memberId);
	int insertPermission(Permission permission);
	int deletePermission(int permissionId);
	List<Map<String, Object>> selectWaitingForPermissionList();
	Map<String, Object> selectWaitingForPermissionOne(int permissionId);
}
