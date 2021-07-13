package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.LectureMemberEntranceRecord;

@Mapper
public interface LectureMemberEntranceRecordMapper {
	List<LectureMemberEntranceRecord> selectLectureMemberEntranceRecordList();
}
