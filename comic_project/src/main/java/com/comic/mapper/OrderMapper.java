package com.comic.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.comic.model.OrderViewVO;

public interface OrderMapper {
	
	public void orderInsert(OrderViewVO vo);

	public List<OrderViewVO> orderSelect();
	
	public void orderUpdate(OrderViewVO vo);
	
	public void orderDelete(int number);
	
	public List<Map<String, Object>> orderProductSelect(String category);
	
	public int productCheck(String productName);

	public void productInsert(@Param("productName") String productName,@Param("productCategory") String productCategory);

	public void productCategoryUpdate(OrderViewVO vo);

	public void porductCateoryAllDelete(int number);

	public void porductCateoryDelete(int number);

	public String getCategoryValue(int number);

}
