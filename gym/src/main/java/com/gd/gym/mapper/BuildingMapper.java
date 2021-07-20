package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Building;

@Mapper
public interface BuildingMapper {
	List<Building> selectBuildingList(int memberId);
	int insertBuilding(Building building);
	int deleteBuilding(int buildId);
}
