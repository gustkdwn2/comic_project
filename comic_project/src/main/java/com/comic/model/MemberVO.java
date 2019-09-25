package com.comic.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {

	private String MEMBER_ID;
	private String MEMBER_PWD;
	private String MEMBER_NAME;
	private String MEMBER_EMAIL;
	private String MEMBER_PHONE_NUMBER;

	private List<AuthVO> authList;

}
