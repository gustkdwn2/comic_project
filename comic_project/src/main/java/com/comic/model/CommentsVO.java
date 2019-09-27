package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class CommentsVO {
	
	private int CMNT_NUM;
	private Long CMNT_BOARDNUM;
    private String CMNT_ID;
    private String CMNT_CONTENT;
    private Date CMNT_DATE;

}
