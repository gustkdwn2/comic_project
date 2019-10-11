package com.comic.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.comic.model.EmployeeVO;


public interface ManagementMapper {
	public List<EmployeeVO>employeelist();
	public void deletemng(@Param("emppwd") String emppwd,@Param("mngnum")  String mngnum);
	public int managerlogin(@Param("empnum") String empnum,@Param("emppwd") String  emppwd);
	
	public int managerloginrecord
	(@Param("empnum") String empnum,@Param("emppwd") String  emppwd,@Param("todaydate") String  todaydate);
	
	public void managerattendance(@Param("empnum") String empnum);
	
	public void managerleavework(@Param("empnum") String empnum,@Param("leaveworkday")String leaveworkday);
}
