package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/member")
public class LoginController {

	@GetMapping("/AdminLogin")
	public void AdminLogin() {
		
	}
	
	@GetMapping("/Register")
	public void Register() {
		
	}
}
