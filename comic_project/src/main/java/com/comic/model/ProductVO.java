package com.comic.model;

import lombok.Data;

@Data
public class ProductVO {
	
	private int product_num;
	private String product_name;
	private int product_price;
	private int product_qty;
	private String product_category;
}
