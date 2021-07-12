package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Admin;

@Mapper
public interface AdminMapper {
	Admin selectAdminByLogin(Admin admin); 		// 관리자 로그인
	List<Admin> selectAdminList();				// 관리자 목록
	Admin selectAdminOne(int adminId);			// 관리자 상세목록
	int insertAdmin(Admin admin);				// 관리자 등록
	int updateAdmin(Admin admin);				// 관리자 수정
	int deleteAdmin(int adminId);				// 관리자 삭제
}
