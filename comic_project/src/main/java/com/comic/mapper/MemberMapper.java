package com.comic.mapper;

import com.comic.model.MemberVO;

public interface MemberMapper {
	
	public void memberInsert (MemberVO vo);
	
	public MemberVO read(String username);
	
}
