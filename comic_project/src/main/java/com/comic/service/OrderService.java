package com.comic.service;

import java.util.List;

import com.comic.model.OrderProductViewVO;
import com.comic.model.OrderViewVO;
import com.comic.model.ProductVO;

public interface OrderService {
	
	public void registerCategory(OrderViewVO vo);
	
	public List<OrderViewVO> readCategory();
	
	public void updateCategory(OrderViewVO vo);
	
	public void deleteCategory(int number);
	
	public List<ProductVO> readProduct(String category);
	
	public int productCheck(String productName);
	
	public void productInsert(String productName, String productCategory);

}
