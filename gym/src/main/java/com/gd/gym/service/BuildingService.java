package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.mapper.BuildingMapper;
import com.gd.gym.vo.Building;

@Service
@Transactional
public class BuildingService {
	
	@Autowired private BuildingMapper buildingMapper;
	
	// getBuildingList Service
	public List<Building> getBuildingList(int memberId) {
		return buildingMapper.selectBuildingList(memberId);
	}
	
	// addBuilding Service
	public int addBuilding(Building building) {
		return buildingMapper.insertBuilding(building);
	}
	
	// removeBuilding Service
	public int removeBuilding(int buildingId) {
		return buildingMapper.deleteBuilding(buildingId);
	}
}
