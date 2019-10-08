package com.comic.service;

import java.util.Date;
import java.util.List;

import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
import com.comic.model.MemberVO;
import com.comic.model.ProductVO;

public interface MemberService {
	
	// 일반 회원가입
	public void memberRegister(MemberVO vo);
	// 일반 로그인
	MemberVO memberLogin(LoginVO loginVO) throws Exception;
	// 일반 로그인 유지 처리
	public void MemberkeepLogin(String MEMBER_ID, String sessionId, Date sessionLimit) throws Exception;
	// 일반 관리 페이지
	public List<MemberVO> MemberGetList();
	// 직원 회원가입
	public void employeeRegister(EmployeeVO vo);
	// 직원 로그인
	EmployeeVO employeeLogin(LoginVO loginVO) throws Exception;
	// 직원 로그인 유지 처리
	public void EmployeekeepLogin(int EMPLOYEE_NUM, String sessionId, Date sessionLimit) throws Exception;
	// 세션키 검증
	MemberVO checkLoginBefore(String value) throws Exception;
	
}
