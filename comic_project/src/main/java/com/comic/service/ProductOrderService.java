package com.comic.service;

import java.util.List;

import com.comic.model.ProductOrderVO;

public interface ProductOrderService {
	
	public List<ProductOrderVO> productOrderList();
	
	public void productOrderRemove(int productOrder_num);
	
}
