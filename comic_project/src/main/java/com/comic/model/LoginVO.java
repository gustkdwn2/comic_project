package com.comic.model;

import lombok.Data;

@Data
public class LoginVO {
	
	private String MEMBER_ID;
	private String MEMBER_PWD;
	private boolean useCookie;
	
}