package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.OrderMapper;
import com.comic.model.OrderViewVO;
import com.comic.service.OrderService;

import lombok.Setter;

@Service
public class OrderServiceImpl implements OrderService{

	@Setter(onMethod_ = @Autowired)
	private OrderMapper ordermapper;
	
	@Override
	public void registerCategory(OrderViewVO vo) {
		ordermapper.orderInsert(vo);
	}

	@Override
	public List<OrderViewVO> readCategory() {
		return ordermapper.orderSelect();
	}

	@Override
	public void updateCategory(OrderViewVO vo) {
		ordermapper.orderUpdate(vo);
	}

	@Override
	public void deleteCategory(int number) {
		ordermapper.orderDelete(number);
	}

}
