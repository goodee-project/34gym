package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.LockerRentalPriceMapper;
import com.gd.gym.vo.LockerRentalPrice;

@Service
@Transactional
public class LockerRentalPriceService {
	@Autowired LockerRentalPriceMapper lockerRentalPriceMapper;
	@Autowired Debug de;
	
	// 라커 1개월 비용 조회 (목록)
	public List<LockerRentalPrice> getLockerRentalPriceList() {
		return lockerRentalPriceMapper.selectLockerRentalPrice();
	}
	
	// 라커 1개월 비용 등록
	public int addLockerRentalPrice(LockerRentalPrice lockerRentalPrice) {
		// 매개변수 디버깅
		de.debugging("addLockerRentalPrice", "lockerRentalPrice", lockerRentalPrice.toString());
		return lockerRentalPriceMapper.insertLockerRentalPrice(lockerRentalPrice);
	}
	
	// 라커 1개월 비용 수정
	public int modifyLockerRentalPrice(LockerRentalPrice lockerRentalPrice) {
		// 매개변수 디버깅
		de.debugging("modifyLockerRentalPrice", "lockerRentalPrice", lockerRentalPrice.toString());
		return lockerRentalPriceMapper.updateLockerRentalPrice(lockerRentalPrice);
	}
	
	// 라커 1개월 비용 수정 시 기존 정보 가져오기
	public Map<String, Object> getLockerRentalPriceById(int lockerRentalPriceId) {
		// 매개변수 디버깅
		de.debugging("getLockerRentalPriceById", "lockerRentalPriceId", lockerRentalPriceId);
		return lockerRentalPriceMapper.selectLockerRentalPriceById(lockerRentalPriceId);
	}
	
	// 라커 1개월 비용 삭제
	public int removeLockerRentalPrice(int lockerRentalPriceId) {
		// 매개변수 디버깅
		de.debugging("removeLockerRentalPrice", "lockerRentalPriceId", lockerRentalPriceId);
		return lockerRentalPriceMapper.deleteLockerRentalPrice(lockerRentalPriceId);
	}
}
