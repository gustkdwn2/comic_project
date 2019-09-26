package com.comic.controller;

import org.springframework.security.access.prepost.PostAuthorize;
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

	@PostAuthorize("permitAll()")
	@GetMapping("/MemberLogin")
	public void AdminLogin() {
		
	}
	
	@PostAuthorize("permitAll()")
	@GetMapping("/MemberRegister")
	public void Register() {
		
	}
	
	@PostAuthorize("permitAll()")
	@PostMapping("/MemberRegister")
	public String Register(MemberVO vo) {
		service.memberRegister(vo);
		return "redirect:/member/MemberLogin";
	}
}
