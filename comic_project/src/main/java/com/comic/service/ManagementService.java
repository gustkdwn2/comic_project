package com.comic.service;

import java.util.List;

import com.comic.model.EmployeeVO;

public interface ManagementService {
	public List<EmployeeVO> managerList();
	public void deletemng(String emppwd,String mngnum);
	public int managerlogin(String empnum, String emppwd);
	public int managerloginrecord(String empnum, String emppwd,String todaydate);
	public void managerattendance(String empnum);
}
