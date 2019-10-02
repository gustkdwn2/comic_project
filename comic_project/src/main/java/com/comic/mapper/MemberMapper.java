package com.comic.mapper;

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
	public MemberVO login(LoginVO loginVO);
	// 로그인 유지 처리
	public void keepLogin(String MEMBER_ID, String sessionId, Date sessionLimit);
	// 세션키 검증
	public MemberVO checkUserWithSessionKey(String value);
	
}
