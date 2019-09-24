package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.LossVO;


public interface LossMapper {
	public List<LossVO> lossList();

	public void lossInsert(@Param("category") String category,@Param("errorNum") int errorNum, @Param("num") int num,@Param("pay") int pay);
}
