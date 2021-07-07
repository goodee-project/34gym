package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Admin;

@Mapper
public interface AdminMapper {
	Admin selectAdminByLogin(Admin admin); // 관리자 로그인
}
