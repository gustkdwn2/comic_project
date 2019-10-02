package com.comic.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.MemberMapper;
import com.comic.model.EmployeeVO;
import com.comic.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

   @Autowired
   private MemberMapper mapper;
   //private String password;
   


   @Override
   public void employeeRegister(EmployeeVO vo) {
		
//	password = vo.getEMPLOYEE_PWD();
//	vo.setEMPLOYEE_PWD(passwordEncoder.encode(password));	 
    mapper.employeeInsert(vo);
   }
}