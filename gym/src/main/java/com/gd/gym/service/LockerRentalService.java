package com.gd.gym.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.LockerMapper;
import com.gd.gym.mapper.LockerRentalMapper;
import com.gd.gym.mapper.LockerRentalPriceMapper;
import com.gd.gym.vo.Locker;

@Service
@Transactional
public class LockerRentalService {
	@Autowired Debug de;
	@Autowired LockerRentalMapper lockerRentalMapper;
	@Autowired LockerMapper lockerMapper;
	@Autowired LockerRentalPriceMapper lockerRentalPriceMapper;
	
	public void addLockerRental(int permissionId) {

		int lockerRentalPriceId = lockerRentalPriceMapper.selectCurrentDateById();
		List<Locker> locekrId = lockerMapper.selectLockerList(permissionId);

		for(Locker locker : locekrId) {
			lockerRentalMapper.insertLockerRental(locker.getLockerId(), lockerRentalPriceId);
		}
	}
}
