package com.comic.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.comic.mapper.ProductOrderMapper;
import com.comic.model.ProductOrderVO;
import com.comic.service.ProductOrderService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProductOrderServiceImple implements ProductOrderService {
	
	private ProductOrderMapper mapper;

	@Override
	public List<ProductOrderVO> productOrderList() {
		return mapper.productOrderList();
	}

}
