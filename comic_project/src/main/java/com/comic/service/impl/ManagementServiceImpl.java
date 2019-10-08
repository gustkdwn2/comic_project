package com.comic.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.ManagementMapper;

import com.comic.model.EmployeeVO;
import com.comic.service.ManagementService;

import lombok.Setter;

@Service
public class ManagementServiceImpl implements ManagementService {

	@Setter(onMethod_ = @Autowired)
	private ManagementMapper managementMapper;	
	
	@Override
	public List<EmployeeVO> managerList() {
		return managementMapper.employeelist();
	}

	@Override
	public void deletemng(String emppwd, String mngnum) {
		managementMapper.deletemng(emppwd, mngnum);
		
	}

	@Override
	public int managerlogin(String empnum, String emppwd) {
		// TODO Auto-generated method stub
		return managementMapper.managerlogin(empnum, emppwd);
	}

	@Override
	public int managerloginrecord(String empnum, String emppwd,String todaydate) {
		// TODO Auto-generated method stub
		return managementMapper.managerloginrecord(empnum, emppwd,todaydate);
	}

	@Override
	public void managerattendance(String empnum) {
		// TODO Auto-generated method stub
		managementMapper.managerattendance(empnum);
	}
	
	@Override
	public void managerleavework(String empnum) {
		// TODO Auto-generated method stub
		managementMapper.managerleavework(empnum);
	}
	
	

}
