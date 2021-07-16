package com.gd.gym.service;

import java.util.List;
import java.util.Map;

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
	
	// 현재 락커 1개월비용이 적용된 이용권 등록
	public void addLockerRental(int permissionId) {
		
		// 우선적으로 적용된 락커이용권 존재하면 삭제
		lockerRentalMapper.deleteLocekRentalByLockerRentalPriceId();
		// 현재 적용중인 락커 1개월비용 ID 가져오기
		int lockerRentalPriceId = lockerRentalPriceMapper.selectCurrentDateById();
		
		// 지점별 락커ID 호출
		List<Locker> locekrId = lockerMapper.selectLockerList(permissionId);

		// 락커ID + 현재 적용중인 락커 1개월비용 ID 부여
		for(Locker locker : locekrId) {
			lockerRentalMapper.insertLockerRental(locker.getLockerId(), lockerRentalPriceId);
		}
	}
	
	// 현재 락커 1개월비용이 적용된 이용권 갯수
	public int getLockerRentalCntByLocekrRentalPriceId() {
		return lockerRentalMapper.selectLockerRentalCntByLocekrRentalPriceId();
	}
	
	// 지점별 판매중인 락커목록
	public List<Map<String, Object>> getLockerRentalCheck(int permissionId) {
		return lockerRentalMapper.selectLockerRentalCheck(permissionId);
	}
}
