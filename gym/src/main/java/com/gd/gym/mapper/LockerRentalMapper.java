package com.gd.gym.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LockerRentalMapper {
	int insertLockerRental(int lockerId, int lockerRentalPriceId);
}
