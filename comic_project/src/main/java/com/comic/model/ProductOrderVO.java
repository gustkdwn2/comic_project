package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class ProductOrderVO {
	
	private int productOrder_num; // 발주 번호
	private int productOrder_product_num; // 상품 번호
	private int productOrder_cost; // 발주 구매가
	private int productOrder_qty; // 발주 수량
	private Date productOrder_date; // 발주 날짜
	
}
