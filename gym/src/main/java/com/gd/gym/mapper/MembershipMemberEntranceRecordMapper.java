package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipMemberEntranceRecord;

@Mapper
public interface MembershipMemberEntranceRecordMapper {
	List<MembershipMemberEntranceRecord> selectMembershipMemberEntranceRecordList();
}
