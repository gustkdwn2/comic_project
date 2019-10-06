package com.comic.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.comic.mapper.MemberMapper;
import com.comic.mapper.OrderMapper;
import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
import com.comic.model.MemberVO;
import com.comic.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Setter;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	private String password;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public void memberRegister(MemberVO vo) {
		password = vo.getMEMBER_PWD();
		vo.setMEMBER_PWD(passwordEncoder.encode(password));
		mapper.memberInsert(vo);
	}

	@Override
	public void employeeRegister(EmployeeVO vo) {
		password = vo.getEMPLOYEE_PWD();
		vo.setEMPLOYEE_PWD(passwordEncoder.encode(password));
		mapper.employeeInsert(vo);
	}

	@Override
	public MemberVO memberLogin(LoginVO loginVO) throws Exception{
		System.out.println("멤버 서비스impl 도착");
		return mapper.login(loginVO);
	}

	@Override
	public void keepLogin(String MEMBER_ID, String sessionId, Date sessionLimit) throws Exception {
		mapper.keepLogin(MEMBER_ID, sessionId, sessionLimit);
	}

	@Override
	public MemberVO checkLoginBefore(String value) throws Exception {
		return mapper.checkUserWithSessionKey(value);
	}
}