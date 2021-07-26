package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Refusal;

@Mapper
public interface RefusalMapper {
	int updatePermissionLevel(int permissionId);
	int insertRefusal(Refusal refusal);
}
