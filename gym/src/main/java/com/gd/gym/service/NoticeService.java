package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.NoticeMapper;
import com.gd.gym.vo.Notice;
import com.gd.gym.vo.Page;

@Service
@Transactional
public class NoticeService {
	@Autowired NoticeMapper noticeMapper;
	@Autowired Debug de;
	
	// 공지사항 조회 (목록)
	public List<Notice> getNoticeList(Page page) {
		return noticeMapper.selectNotice(page);
	}
	
	public int getNoticeTotal() {
		return noticeMapper.selectNoticeTotal();
	}
	
	// 공지사항 상세보기
	public Map<String, Object> getNoticeOne(int noticeId) {
		// 매개변수 디버깅
		de.debugging("getNoticeOne", "noticeId", noticeId);
		
		return noticeMapper.selectNoticeOne(noticeId);
	}
	
	// 공지사항 등록
	public int addNotice(Map<String, Object> map) {
		// 매개변수 디버깅
		de.debugging("addNotice", "map", map.toString());
		
		return noticeMapper.insertNotice(map);
	}
	
	// 공지사항 수정
	public int modifyNotice(Notice notice) {
		// 매개변수 디버깅
		de.debugging("modifyNotice", "notice", notice.toString());
		
		return noticeMapper.updateNotice(notice);
	}
	
	// 공지사항 삭제
	public int removeNotice(int noticeId) {
		// 매개변수 디버깅
		de.debugging("removeNotice", "noticeId", noticeId);
		
		return noticeMapper.deleteNotice(noticeId);
	}
	
}
