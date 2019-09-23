package com.comic.service.impl;

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
		ordermapper.OrderInsert(vo);
	}

}
