package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class OrderVO {
	
	private int order_num;
	private String order__id;
	private int order_roomnum;
	private Date order_time;
	private int order_product_num;
	private int drder_qty;
	
}
