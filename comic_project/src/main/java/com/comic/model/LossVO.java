package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class LossVO {
	
	private int loss_num;
	private String loss_category;
	private int loss_qty;
	private int loss_pay;
	private String loss_product;
	private Date loss_date; 
}
