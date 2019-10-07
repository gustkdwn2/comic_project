package com.comic.mapper;

import java.io.Console;
import java.util.Date;

import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
import com.comic.model.MemberVO;

public interface MemberMapper {
	
	// 일반 회원가입
	public void memberInsert(MemberVO vo);
	// 직원 회원가입
	public void employeeInsert(EmployeeVO vo);
	// 일반 로그인
	public MemberVO memberLogin(LoginVO loginVO);
	// 직원 로그인
	public EmployeeVO employeeLogin(LoginVO loginVO);
	// 일반 로그인 유지 처리
	public void MemberkeepLogin(String mEMBER_ID, String sessionId, Date sessionLimit);
	// 직원 로그인 유지 처리
	public void EmployeekeepLogin(int eMPLOYEE_NUM, String sessionId, Date sessionLimit);	
	// 세션키 검증
	public MemberVO checkUserWithSessionKey(String value);
	
}
