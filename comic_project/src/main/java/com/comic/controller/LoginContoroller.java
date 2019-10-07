package com.comic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comic.model.EmployeeVO;
import com.comic.service.MemberService;

@Controller
public class LoginContoroller {
	
	@Autowired
	MemberService service;
	
	//직원 추가
	   @GetMapping("/EmployeeRegister")
	   public String EmployeeRegister() {
	      return "/younghak/EmployeeRegister";
	   }
	   
	   @PostMapping("/EmployeeRegister")
	   public String EmployeeRegister(EmployeeVO vo) {
	      service.employeeRegister(vo);
	      return "redirect:/index";
	   }
}
