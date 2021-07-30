package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Resume;

@Mapper
public interface ResumeMapper {
	// 이력서 입력
	int insertResume(Resume resume);
	// 회원 이력서 목록
	List<Map<String, Object>> selectResumeListById(int memberId);
	// 이력서 수정
	int updateResume(Resume Resume);
	// 이력서 삭제
	int deleteResume(int resumeId);
	// 이력서 상세보기
	Map<String, Object> selectResumeOne(int resumeId);
}
