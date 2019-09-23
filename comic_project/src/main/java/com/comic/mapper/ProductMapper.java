package com.comic.mapper;

import java.util.List;

import com.comic.model.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> productGetList();
	
	public ProductVO productRead(int num);
	
	public void productInsert(ProductVO vo);
	
	public int productUpdate(ProductVO vo);
	
	public int productDelete(int num);
	
}
