package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Permission;

@Mapper
public interface PermissionMapper {
	List<Permission> selectPermissionList(int memberId);
	int insertPermission(Permission permission);
	int deletePermission(int permissionId);
}
