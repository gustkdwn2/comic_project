package com.comic.model;

import lombok.Data;

@Data
public class ProductVO {
//	PRODUCT_NUM NUMBER PRIMARY KEY,  -- 상품 번호
//	PRODUCT_NAME VARCHAR2(20) NOT NULL, -- 상품이름
//	PRODUCT_PRICE NUMBER NOT NULL, -- 상품 판매가
//	PRODUCT_QTY NUMBER NOT NULL, -- 상품 수량
//	PRODUCT_CATEGORY VARCHAR2(20) NOT NULL -- 상품 종류

	private int product_num;
	private String product_name;
	private int product_price;
	private int product_qty;
	private String product_category;
}
