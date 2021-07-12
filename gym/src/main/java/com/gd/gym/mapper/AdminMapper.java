package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Admin;

@Mapper
public interface AdminMapper {
	Admin selectAdminByLogin(Admin admin); 					// 관리자 로그인
	List<Admin> selectAdminList();							// 관리자 목록
}
