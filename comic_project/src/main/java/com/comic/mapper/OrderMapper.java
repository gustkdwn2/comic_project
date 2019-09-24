package com.comic.mapper;

import java.util.List;

import com.comic.model.OrderViewVO;

public interface OrderMapper {
	
	public void orderInsert(OrderViewVO vo);

	public List<OrderViewVO> orderSelect();
	
	public void orderUpdate(OrderViewVO vo);
	
	public void orderDelete(int number);
}
