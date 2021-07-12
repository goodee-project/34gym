package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Notice;

@Mapper
public interface NoticeMapper {
	List<Notice> selectNotice();
	List<Map<String, Object>> selectNoticeOne(int noticeId);
	int insertNotice(Notice notice);
	int updateNotice(Notice notice);
	int deleteNotice(int noticeId);
}
