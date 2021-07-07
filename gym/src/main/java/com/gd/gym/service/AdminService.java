package com.gd.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.gym.mapper.AdminMapper;
import com.gd.gym.vo.Admin;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
	public Admin getLoginAdmin(Admin admin) {
		log.debug(admin.toString()+" DB연동 로그인 테스트 ");
		return adminMapper.selectAdminByLogin(admin);
	}
}
