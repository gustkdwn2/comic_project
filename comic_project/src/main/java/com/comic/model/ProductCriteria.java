package com.comic.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductCriteria {
	
	private int pageNum;
	private int amount;
	
	public ProductCriteria() {
		this(1, 10);
	}
	
	public ProductCriteria(int pageNum,int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
}
