package com.comic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.comic.mapper.MemberMapper;
import com.comic.model.MemberVO;
import com.comic.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Data;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
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
		password = vo.getMEMBER_PWD();
		vo.setMEMBER_PWD(passwordEncoder.encode(password));
		System.out.println(vo.getMEMBER_PWD());
		System.out.println("VO값 : " + vo);
		mapper.memberInsert(vo);
	}
}