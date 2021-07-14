package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LectureMapper {
	List<Map<String, Object>> selectLecture();
}
