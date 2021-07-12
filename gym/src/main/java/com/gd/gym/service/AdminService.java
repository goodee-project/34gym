package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.AdminMapper;
import com.gd.gym.vo.Admin;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class AdminService {
	@Autowired AdminMapper adminMapper;
	@Autowired Debug de;
	
	// 관리자 로그인
	public Admin getLoginAdmin(Admin admin) {
		log.debug(admin.toString()+"관리자 로그인 Service");
		return adminMapper.selectAdminByLogin(admin);
	}
	
	// 관리자 목록
	public List<Admin> getAdminList(){
		return adminMapper.selectAdminList();
	}
	// 관리자 입력
	public int addAdmin(Admin admin) {
		int addRow = adminMapper.insertAdmin(admin);
		de.debugging("addAdmin", "Service addrow",addRow);
		return addRow;
	}
	// 관리자 삭제
	public int removeAdmin(int adminId) {
		int removeRow = adminMapper.deleteAdmin(adminId);
		de.debugging("removeAdmin", "Service removeRow",removeRow);
		return removeRow;
	}
	
	// 관리자 수정
	public int modifyAdmin(Admin admin) {
		int modifyRow = adminMapper.updateAdmin(admin);
		de.debugging("modifyAdmin", "Service modifyRow",modifyRow);
		return modifyRow;
	}
	
	// 관리자 상세목록
	public Admin getAdminOne(int adminId) {
		return adminMapper.selectAdminOne(adminId);
	}	
}
