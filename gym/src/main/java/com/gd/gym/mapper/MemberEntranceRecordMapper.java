package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberEntranceRecordMapper {
	List<Map<String, Object>> selectMemberEntranceRecordList(int permissionId);
}
