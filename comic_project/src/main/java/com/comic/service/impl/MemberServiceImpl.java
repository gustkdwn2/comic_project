package com.comic.service.impl;

import org.springframework.stereotype.Service;

import com.comic.mapper.MemberMapper;
import com.comic.model.AuthVO;
import com.comic.model.MemberVO;
import com.comic.service.MemberService;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	
	@Override
	public void memberRegister(MemberVO vo) {
		mapper.memberInsert(vo);
	}

}
