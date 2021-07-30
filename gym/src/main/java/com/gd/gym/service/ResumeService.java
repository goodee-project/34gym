package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.ResumeMapper;
import com.gd.gym.vo.Resume;
import com.gd.gym.vo.Resume;

@Service
@Transactional
public class ResumeService {
	@Autowired ResumeMapper resumeMapper;
	@Autowired Debug de;
	
	// 이력서 입력
	public int addResume(Resume resume) {
		int addRow = resumeMapper.insertResume(resume);
		de.debugging("addResume", "Service addRow", addRow);
		// 가져온 id 주입 후 insert 실행
		return addRow;
	}
	
	// 회원 이력서  목록
	public List<Map<String, Object>> getResumeListById(int memberId) {
		return resumeMapper.selectResumeListById(memberId);
	}
	
	// 이력서 수정
	public int modifyResume(Resume resume) {
		int modifyRow = resumeMapper.updateResume(resume);
		de.debugging("modifyResume", "Service modifyRow", modifyRow);
		return modifyRow;
	}
	
	// 이력서 삭제
	public int removeResume(int resumeId) {
		de.debugging("removeResume", "Service resumeId", resumeId);
		
		int removeRow = resumeMapper.deleteResume(resumeId);
		de.debugging("removeResume", "Service removeRow", removeRow);
		return removeRow;
	}
	
	// 이력서 상세보기
	public Map<String, Object> getResumeOne(Integer resumeId){
		de.debugging("getResumeOne", "Service resumeId", resumeId);
		
		return resumeMapper.selectResumeOne(resumeId);
	}
}
