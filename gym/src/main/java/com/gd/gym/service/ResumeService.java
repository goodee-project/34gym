package com.gd.gym.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.ResumeMapper;
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
}
