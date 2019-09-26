package com.comic.mapper;

import java.util.List;

import com.comic.model.SalesStatisticsVO;

public interface SalesStatisticsMapper {

	public List<SalesStatisticsVO> productsalesData();
	
	public List<SalesStatisticsVO> roomsalesData();

}
