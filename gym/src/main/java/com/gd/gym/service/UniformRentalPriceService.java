package com.gd.gym.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gd.gym.debug.Debug;
import com.gd.gym.mapper.UniformRentalPriceMapper;
import com.gd.gym.vo.UniformRentalPrice;

@Service
@Transactional
public class UniformRentalPriceService {
	@Autowired UniformRentalPriceMapper uniformRentalPriceMapper;
	@Autowired Debug de;
	
	// 운동복 1개월 비용 조회 (목록)
	public List<UniformRentalPrice> getUniformRentalPriceList() {
		return uniformRentalPriceMapper.selectUniformRentalPrice();
	}
	
	// 운동복 1개월 비용 등록
	public int addUniformRentalPrice(UniformRentalPrice uniformRentalPrice) {
		// 매개변수 디버깅
		de.debugging("addUniformRentalPrice", "uniformRentalPrice", uniformRentalPrice.toString());
		return uniformRentalPriceMapper.insertUniformRentalPrice(uniformRentalPrice);
	}
	
	// 운동복 1개월 비용 수정
	public int modifyUniformRentalPrice(UniformRentalPrice uniformRentalPrice) {
		// 매개변수 디버깅
		de.debugging("modifyUniformRentalPrice", "uniformRentalPrice", uniformRentalPrice.toString());
		return uniformRentalPriceMapper.updateUniformRentalPrice(uniformRentalPrice);
	}
	
	// 운동복 1개월 비용 수정 시 기존 정보 가져오기
	public Map<String, Object> getUniformRentalPriceById(int uniformRentalPriceId) {
		// 매개변수 디버깅
		de.debugging("getUniformRentalPriceById", "uniformRentalPriceId", uniformRentalPriceId);
		return uniformRentalPriceMapper.selectUniformRentalPriceById(uniformRentalPriceId);
	}
	
	// 운동복 1개월 비용 삭제
	public int removeUniformRentalPrice(int uniformRentalPriceId) {
		// 매개변수 디버깅
		de.debugging("removeUniformRentalPrice", "uniformRentalPriceId", uniformRentalPriceId);
		return uniformRentalPriceMapper.deleteUniformRentalPrice(uniformRentalPriceId);
	}
}
