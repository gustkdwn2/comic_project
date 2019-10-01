package com.comic.mapper;

import java.util.List;

import com.comic.model.ProductVO;

public interface ProductMapper {
	
	public List<ProductVO> productGetList();
	
	public ProductVO productRead(int product_num);
	
	public void productInsert(ProductVO vo);
	
	public int productUpdate(ProductVO vo);
	
	public int productDelete(int product_num);
	
	public ProductVO productNameCheck(String product_name);
	
}
