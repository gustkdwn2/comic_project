package com.comic.mapper.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import com.comic.model.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	
	private static final long serialVersionUID = 1L;
	
	private MemberVO member;
	
	public CustomUser(String MEMBER_ID, String MEMBER_PWD, Collection<? extends GrantedAuthority> authorities) {
		super(MEMBER_ID, MEMBER_PWD, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		
		super(vo.getMEMBER_ID(), vo.getMEMBER_PWD(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.member = vo;
	}
}
