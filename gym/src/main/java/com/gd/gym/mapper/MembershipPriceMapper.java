package com.gd.gym.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipPrice;

@Mapper
public interface MembershipPriceMapper {
	List<MembershipPrice> selectMembershipPrice();
	int insertMembershipPrice(MembershipPrice membershipPrice);
	int updateMembershipPrice(MembershipPrice membershipPrice);
	Map<String, Object> selectMembershipPriceById(int membershipPriceId);
	int deleteMembershipPrice(int membershipPriceId);
	List<MembershipPrice> selectMembershipNameListbyId();
	// 구매한 운동이용권 가격
	int selectMembershipPriceForAmount(int membershipPriceId);
}
