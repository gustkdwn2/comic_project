package com.comic.service;

import java.util.Date;

import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
import com.comic.model.MemberVO;

public interface MemberService {
	
	// 일반 회원가입
	public void memberRegister(MemberVO vo);
	// 직원 회원가입
	public void employeeRegister(EmployeeVO vo);
	// 일반 로그인
	public MemberVO memberLogin(LoginVO loginVO) throws Exception;
	// 로그인 유지 처리
	public void keepLogin(String MEMBER_ID, String id, Date sessionLimit) throws Exception;
	// 세션키 검증
	MemberVO checkLoginBefore(String value) throws Exception;

}
