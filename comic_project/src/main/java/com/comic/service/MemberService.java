package com.comic.service;

import java.util.Date;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
import com.comic.model.MemberVO;
import com.comic.model.ProductVO;

public interface MemberService {
	
	// 멤버 회원가입
	public void memberRegister(MemberVO vo);
	// 멤버 로그인
	MemberVO memberLogin(LoginVO loginVO) throws Exception;
	// 멤버 로그인 유지 처리
	public void MemberkeepLogin(String MEMBER_ID, String sessionId, Date sessionLimit) throws Exception;
	// 멤버 관리 페이지
	public List<MemberVO> MemberGetList();
	// 멤버 모달창 값 전달
	public MemberVO MemberModifyGet(String MEMBER_ID);
	// 관리자가 멤버 정보 수정
	public void MemberModify(MemberVO vo);
	// 멤버 정보 삭제
	public void MemberRemove(String mEMBER_ID);
	// 멤버 비밀번호 수정
	public void MemberPasswordModify(HttpServletResponse response, MemberVO vo) throws Exception;
	// 멤버 정보 수정
	public void MemberModify2(HttpServletResponse response, MemberVO vo) throws Exception;
	// 직원 회원가입
	public void employeeRegister(EmployeeVO vo);
	// 직원 로그인
	EmployeeVO employeeLogin(LoginVO loginVO) throws Exception;
	// 직원 로그인 유지 처리
	public void EmployeekeepLogin(int EMPLOYEE_NUM, String sessionId, Date sessionLimit) throws Exception;
	// 세션키 검증
	MemberVO checkLoginBefore(String value) throws Exception;
	

}
