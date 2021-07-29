package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.LectureMemberInbodyMapper;
import com.gd.gym.vo.LectureMemberInbody;

@Service
@Transactional
public class LectuerMemberInbodyService {
	@Autowired LectureMemberInbodyMapper lectureMemberInbodyMapper;
	@Autowired Debug de;
	
	// 강좌 회원 인바디 입력
	public int addLectureMemberInbody(LectureMemberInbody lectureMemberInbody) {
		int addRow = lectureMemberInbodyMapper.insertLectureMemberInbody(lectureMemberInbody);
		de.debugging("addLectureMemberInbody", "Service addrow", addRow);
		return addRow;
	}
	
	// 강좌 회원 인바디 목록
	public List<Map<String, Object>> getLectureMemberInbodyList(int memberId){
		return lectureMemberInbodyMapper.selectLectureMemberInbodyList(memberId);
	}
}
