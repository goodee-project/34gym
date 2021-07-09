package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.EmploymentTypeMapper;
import com.gd.gym.vo.EmploymentType;

@Service
@Transactional
public class EmploymentTypeService {
	@Autowired Debug de;
	@Autowired EmploymentTypeMapper employmentTypeMapper;
	
	// 고용형태(카테고리) 목록
	public List<EmploymentType> getEmploymentTypeList(){
		return employmentTypeMapper.selectEmploymentType();
	}
	
	// 고용형태(카테고리) 입력
	public int addEmploymentType(EmploymentType employmentType) {
		int addRow = employmentTypeMapper.insertEmploymentType(employmentType);
		de.debugging("addEmploymentType", "Service addrow",addRow);
		return addRow;
	}
	// 고용형태(카테고리) 삭제
	public int removeEmploymentType(int employmentTypeId) {
		int removeRow = employmentTypeMapper.deleteEmploymentType(employmentTypeId);
		de.debugging("removeEmploymentType", "Service removeRow",removeRow);
		return removeRow;
	}
	
	// 고용형태(카테고리) 수정
	public int modifyEmploymentType(EmploymentType employmentType) {
		int modifyRow = employmentTypeMapper.updateEmploymentType(employmentType);
		de.debugging("modifyEmploymentType", "Service modifyRow",modifyRow);
		return modifyRow;
	}
	
	// 고용형태(카테고리) 상세목록
	public EmploymentType getEmploymentTypeOne(int employmentTypeId) {
		return employmentTypeMapper.selectEmploymentTypeOne(employmentTypeId);
	}
}
