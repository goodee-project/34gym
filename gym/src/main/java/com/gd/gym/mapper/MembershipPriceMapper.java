package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.MembershipPrice;

@Mapper
public interface MembershipPriceMapper {
	List<MembershipPrice> selectMembershipPrice();
	int insertMembershipPrice(MembershipPrice membershipPrice);
	int updateMembershipPrice(MembershipPrice membershipPrice);
	int deleteMembershipPrice(int membershipPriceId);
}
