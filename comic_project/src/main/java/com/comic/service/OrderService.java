package com.comic.service;

import java.util.List;

import com.comic.model.OrderViewVO;

public interface OrderService {
	
	public void registerCategory(OrderViewVO vo);
	
	public List<OrderViewVO> readCategory();
	
	public void updateCategory(OrderViewVO vo);
	
	public void deleteCategory(int number);
}
