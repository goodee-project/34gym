package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LockerRentalMapper {
	int insertLockerRental(int lockerId, int lockerRentalPriceId);
	int selectLockerRentalCntByLocekrRentalPriceId();
	int deleteLocekRentalByLockerRentalPriceId();
	List<Map<String, Object>> selectLockerRentalCheck(int permissionId);
}
