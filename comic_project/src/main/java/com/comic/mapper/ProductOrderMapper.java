package com.comic.mapper;

import java.util.List;

import com.comic.model.ProductOrderVO;

public interface ProductOrderMapper {
	
	public List<ProductOrderVO> productOrderList();
	
	public void productOrderDelete(int productOrder_num);
	
	public int productOrderNumSelect(int productOrder_num);
	
	public void productOrderNumUpdate(int productOder_num);
	
}
