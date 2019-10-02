package com.comic.mapper;

import java.util.Date;

import com.comic.model.EmployeeVO;

public interface MemberMapper {
   
   // 직원 회원가입
   public void employeeInsert(EmployeeVO vo);
   
}