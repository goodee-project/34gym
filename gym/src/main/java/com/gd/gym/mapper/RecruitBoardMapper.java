package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.Page;
import com.gd.gym.vo.Recruit;

@Mapper
public interface RecruitBoardMapper {
	List<Recruit> selectRecruitList(Page page);
	int insertRecruit(Recruit recruit);
	int selectRecruitTotal();
	Recruit selectRecruitOne(int recruitId);
	int deleteRecruit(int recruitId);
	int updateRecruit(Recruit recruit);
}
