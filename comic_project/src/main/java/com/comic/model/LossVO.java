package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class LossVO {
	
	private String loss_category;
	private int loss_pay;
	private String loss_content;
	private Date loss_date; 
}
