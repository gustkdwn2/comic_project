package com.comic.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.OrderMapper;
import com.comic.model.OrderViewVO;
import com.comic.model.ProductVO;
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

	@Override
	public List<Map<String, Object>> readProduct(String category) {
		return ordermapper.orderProductSelect(category);
	}

	@Override
	public int productCheck(String productName) {
		return ordermapper.productCheck(productName);
	}

	@Override
	public void productInsert(String productName, String productCategory) {
		ordermapper.productInsert(productName, productCategory);
	}

	@Override
	public void productCategoryUpdate(OrderViewVO vo) {
		ordermapper.productCategoryUpdate(vo);
	}

	@Override
	public void porductCateoryAllDelete(int number) {
		ordermapper.porductCateoryAllDelete(number);
	}

	@Override
	public void porductCateoryDelete(int number) {
		ordermapper.porductCateoryDelete(number);
	}

	@Override
	public String getCategoryValue(int number) {
		return ordermapper.getCategoryValue(number);
	}

}
