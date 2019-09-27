package com.comic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.comic.mapper.MemberMapper;
import com.comic.model.MemberVO;
import com.comic.service.MemberService;

import lombok.Data;

@Service
@Data
public class MemberServiceImpl implements MemberService {

	private MemberMapper mapper;
	private String password;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public void memberRegister(MemberVO vo) {
		System.out.println("멤버 서비스임플");
		System.out.println(vo.getMEMBER_ID());
		System.out.println(vo.getMEMBER_PWD());
		System.out.println(vo.getMEMBER_NAME());
		System.out.println(vo.getMEMBER_EMAIL());
		System.out.println(vo.getMEMBER_PHONE_NUMBER());
		System.out.println(vo.getAuthList());
		password = vo.getMEMBER_PWD();
		vo.setMEMBER_PWD(passwordEncoder.encode(password));
		mapper.memberInsert(vo);
	}
}