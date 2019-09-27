package com.comic.controller;

import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comic.model.MemberVO;
import com.comic.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/member")
@AllArgsConstructor
@Log4j
public class LoginController {
	
	private MemberService service;

	@PostAuthorize("permitAll()")
	@GetMapping("/MemberLogin")
	public void AdminLogin() {
		
	}
	
	@PostAuthorize("permitAll()")
	@GetMapping("/AdminRegister")
	public void Register() {
		
	}
	
	@PostAuthorize("permitAll()")
	@PostMapping("/AdminRegister")
	public String Register(MemberVO vo) {
		service.memberRegister(vo);
		return "redirect:/member/AdminLogin";
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		
		log.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
	}
	
	
	@GetMapping("/AdminLogin")
	public void loginInput(String error, String logout, Model model) {
		
		log.info("error: " + error);
		log.info("logout: " + logout);
		
		if (error != null) {
			model.addAttribute("error", "아이디 또는 비밀번호가 틀렸습니다.");
		}
		
		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}
	}
	
	@GetMapping("/customLogout")
	public void logoutGet() {
		
		log.info("custom logout");
	}
	
	@PostMapping("/customLogout")
	public void logoutPost() {
		log.info("post custom logout");
	}
}
