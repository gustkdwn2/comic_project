package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class SalesStatisticsVO {
//	PRODUCTSALES_ID VARCHAR2(20) NOT NULL, -- 사용자 아이디
//	PRODUCTSALES_QTY NUMBER  NOT NULL, -- 수량
//	PRODUCTSALES_TIME DATE NOT NULL, -- 시간(결재 되면)
//	PRODUCTSALES_PRODUCT VARCHAR2(20) NOT NULL, -- 상품 내역
//	PRODUCTSALES_ORDER_PRICE NUMBER NOT NULL -- 상품 요금

	private String productsales_id;
	private int productsales_qty;
	private Date productsales_time;
	private String productsales_product;
	private int productsales_order_price;
	
	
//	ROOMSALES_NUM NUMBER NOT NULL, -- 방번호
//	ROOMSALES_TOTALPRICE NUMBER NOT NULL,-- 방요금
//	ROOMSALES_TIME DATE NOT NULL-- 시간
	
	private int roomsales_num;
	private int roomsales_totalprice;
	private Date roomsales_time;
}
