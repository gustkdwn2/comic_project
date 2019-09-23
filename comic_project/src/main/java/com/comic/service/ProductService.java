package com.comic.service;

import java.util.List;

import com.comic.model.ProductVO;

public interface ProductService {
	
	public List<ProductVO> productGetList();
	
	public ProductVO productGet(int num);
	
	public void productRegister(ProductVO vo);
	
	public boolean modify(ProductVO vo);
	
	public boolean productRemove(int num);
	
}
