package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.UniformRentalPrice;

@Mapper
public interface UniformRentalPriceMapper {
	List<UniformRentalPrice> selectUniformRentalPrice();
	int insertUniformRentalPrice(UniformRentalPrice uniformRentalPrice);
	int updateUniformRentalPrice(UniformRentalPrice uniformRentalPrice);
	Map<String, Object> selectUniformRentalPriceById(int uniformRentalPriceId);
	int deleteUniformRentalPrice(int uniformRentalPriceId);
}
