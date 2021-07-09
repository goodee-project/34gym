package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.LockerRentalPrice;

@Mapper
public interface LockerRentalPriceMapper {
	List<LockerRentalPrice> selectLockerRentalPrice();
	int insertLockerRentalPrice(LockerRentalPrice lockerRentalPrice);
	int updateLockerRentalPrice(LockerRentalPrice lockerRentalPrice);
	Map<String, Object> selectLockerRentalPriceById(int lockerRentalPriceId);
	int deleteLockerRentalPrice(int lockerRentalPriceId);
}
