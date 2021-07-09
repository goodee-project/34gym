package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.EmploymentType;

@Mapper
public interface EmploymentTypeMapper {
	List<EmploymentType> selectEmploymentType();					// 고용형태(카테고리) 리스트 
	EmploymentType selectEmploymentTypeOne(int employmentTypeId);	// 고용형태(카테고리) 상세목록
	int insertEmploymentType(EmploymentType employmentType);		// 고용형태(카테고리) 등록
	int updateEmploymentType(EmploymentType employmentType);		// 고용형태(카테고리) 수정
	int deleteEmploymentType(int employmentTypeId);					// 고용형태(카테고리) 삭제
}
