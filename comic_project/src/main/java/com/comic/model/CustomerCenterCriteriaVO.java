package com.comic.model;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class CustomerCenterCriteriaVO {
	/*
	 * public String getXxx() { return xxx; }
	 * 
	 * public void setXxx(String xxx) { this.xxx = xxx; }
	 */
	
	  private int pageNum;
	  private int amount;
	  
	  private String type;
	  private String keyword;

	public CustomerCenterCriteriaVO(int pageNum, int amount) {
	    this.pageNum = pageNum;
	    this.amount = amount;
	  }

	  public CustomerCenterCriteriaVO() {
	    this(1, 10);
	  }
	  
	  public String[] getTypeArr() {
	    
	    return type == null? new String[] {}: type.split("");
	  }
	  
	  public String getListLink() {
		  
		  UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				  .queryParam("pageNum", this.pageNum)
				  .queryParam("amount", this.getAmount())
				  .queryParam("type", this.getType())
				  .queryParam("keyword", this.getKeyword());
		
		  return builder.toUriString();
		  
	  }

}
