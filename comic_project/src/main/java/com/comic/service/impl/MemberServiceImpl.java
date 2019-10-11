package com.comic.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.comic.mapper.MemberMapper;
import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
import com.comic.model.MemberVO;
import com.comic.service.MemberService;

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
	public MemberVO memberLogin(LoginVO loginVO) throws Exception{
		return mapper.memberLogin(loginVO);
	}
	
	@Override
	public void MemberkeepLogin(String MEMBER_ID, String sessionId, Date sessionLimit) throws Exception {
		mapper.MemberkeepLogin(MEMBER_ID, sessionId, sessionLimit);
	}
	
	@Override
	public List<MemberVO> MemberGetList() {
		return mapper.MemberGetList();
	}
	
	@Override
	public MemberVO MemberModifyGet(String MEMBER_ID) {
		return mapper.MemberRead(MEMBER_ID);
	}
	
	@Override
	public void MemberModify(MemberVO vo) {
		mapper.MemberUpdate(vo);
	}
	
	@Override
	public void MemberRemove(String MEMBER_ID) {
		System.out.println(MEMBER_ID);
		mapper.MemberDelete(MEMBER_ID);
	}
	
	@Override
	public void MemberPasswordModify(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(mapper.MemberCheck(vo) == null) {
			out.print("등록된 회원이 없습니다.");
			out.close();
		} else {
			String pw = "";
			for (int i = 0; i < 4; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setMEMBER_PWD(passwordEncoder.encode(pw));
			mapper.MemberPasswordModify(vo);
			out.print("임시 비밀번호는 " + pw + "입니다.");
			out.close();
		}
	}
	
	@Override
	public void MemberModify2(HttpServletResponse response, MemberVO vo) throws Exception {
		password = vo.getMEMBER_PWD();
		vo.setMEMBER_PWD(passwordEncoder.encode(password));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		mapper.MemberUpdate2(vo);
		out.print("회원정보 수정이 완료되었습니다.");
		out.close();
	}

	@Override
	public void employeeRegister(EmployeeVO vo) {
		password = vo.getEMPLOYEE_PWD();
		vo.setEMPLOYEE_PWD(passwordEncoder.encode(password));
		mapper.employeeInsert(vo);
	}

	@Override
	public void EmployeekeepLogin(int EMPLOYEE_NUM, String sessionId, Date sessionLimit) throws Exception {
		mapper.EmployeekeepLogin(EMPLOYEE_NUM, sessionId, sessionLimit);
	}
	
	@Override
	public EmployeeVO employeeLogin(LoginVO loginVO) throws Exception {
		return mapper.employeeLogin(loginVO);
	}
	
	@Override
	public MemberVO checkLoginBefore(String value) throws Exception {
		return mapper.checkUserWithSessionKey(value);
	}

	@Override
	public MemberVO getMember(MemberVO vo) {
		return mapper.getMember(vo);
	}

}