package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Resume;

@Mapper
public interface ResumeMapper {
	// 이력서 입력
	int insertResume(Resume resume);
}
