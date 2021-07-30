package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.EntranceRecord;

@Mapper
public interface MemberEntranceRecordMapper {
	List<EntranceRecord> selectMembershipMemberEntranceRecordList(int permissionId);
	List<EntranceRecord> selectLectureMemberEntranceRecordList(int permissionId);
}
