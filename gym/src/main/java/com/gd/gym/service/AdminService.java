package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.gym.mapper.AdminMapper;
import com.gd.gym.vo.Admin;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
	// 관리자 로그인
	public Admin getLoginAdmin(Admin admin) {
		log.debug(admin.toString()+"관리자 로그인 Service");
		return adminMapper.selectAdminByLogin(admin);
	}
	
	// 관리자 목록
	public List<Admin> getAdminList(){
		return adminMapper.selectAdminList();
	}
}
