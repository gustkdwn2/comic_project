package com.comic.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.comic.mapper.MemberMapper;
import com.comic.mapper.domain.CustomUser;
import com.comic.model.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = {@Autowired})
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String MEMBER_ID) throws UsernameNotFoundException {
		
		log.warn("Load User By MEMBER_ID : " + MEMBER_ID);
		
		// userName means userid
		MemberVO vo = memberMapper.read(MEMBER_ID);
		
		log.warn("queried by member mapper: " + vo);
		
		return vo == null ? null : new CustomUser(vo);
	}
}