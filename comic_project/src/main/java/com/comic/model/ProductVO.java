package com.comic.model;

import lombok.Data;

@Data
public class ProductVO {
	
	private int product_num; 		 // 상품 번호
	private String product_name; 	 // 상품 이름
	private int product_price; 		 // 상품 판매가
	private int product_qty; 		 // 상품 수량
	private String product_category; // 상품 종류
	
}
