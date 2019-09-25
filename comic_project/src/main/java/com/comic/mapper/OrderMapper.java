package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.OrderViewVO;
import com.comic.model.ProductVO;

public interface OrderMapper {
	
	public void orderInsert(OrderViewVO vo);

	public List<OrderViewVO> orderSelect();
	
	public void orderUpdate(OrderViewVO vo);
	
	public void orderDelete(int number);
	
	public List<ProductVO> orderProductSelect(String category);
	
	public int productCheck(String productName);

	public void productInsert(@Param("productName") String productName,@Param("productCategory") String productCategory);

}
