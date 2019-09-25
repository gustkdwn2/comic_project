package com.comic.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comic.model.MemberVO;
import com.comic.service.MemberService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member")
@AllArgsConstructor
public class LoginController {
	
	private MemberService service;

	@GetMapping("/AdminLogin")
	@PreAuthorize("permitAll()")
	public void AdminLogin() {
		
	}
	
	@GetMapping("/Register")
	@PreAuthorize("permitAll()")
	public void Register() {
		
	}
	
	@PostMapping("/Register")
	@PreAuthorize("permitAll()")
	public String Register(MemberVO vo) {
		service.memberRegister(vo);
		return "redirect:/member/AdminLogin";
	}
}
