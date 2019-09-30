package com.comic.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

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
