package com.gd.gym.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.gd.gym.vo.QnA;

@Mapper
public interface QnABoardMapper {
	List<QnA> selectQnAList();
}
