package com.comic.model;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long BOARD_NUM;
    private String BOARD_ID;
    private String BOARD_CONTENT;
    private Date BOARD_DATE;
    private String BOARD_TITLE;

}
