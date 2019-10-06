package com.comic.controller;

import java.util.Date;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.comic.model.EmployeeVO;
import com.comic.model.LoginVO;
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
	private BCryptPasswordEncoder passEncoder;
	
	//멤버  회원가입
	
	@GetMapping("/MemberRegister")
	public void MemberRegister() {
		
	}
	
	@PostMapping("/MemberRegister")
	public String MemberRegister(MemberVO vo, RedirectAttributes redirectAttributes) throws Exception {
		service.memberRegister(vo);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		return "redirect:/member/MemberLogin";
	}
	
	//직원 추가
	@GetMapping("/EmployeeRegister")
	public void EmployeeRegister() {
		
	}
	
	@PostMapping("/EmployeeRegister")
	public String EmployeeRegister(EmployeeVO vo) {
		service.employeeRegister(vo);
		return "redirect:/member/EmployeeLogin";
	}
	
	// 로그인 페이지
	@GetMapping("/MemberLogin")
	public String loginGET(@ModelAttribute("loginVO") LoginVO loginVO) {
		return "/member/MemberLogin";
	}
	
	// 로그인 
	@PostMapping("/MemberLoginPost")
	public void LoginPOST(LoginVO loginVO, HttpSession httpSession, Model model) throws Exception {
		
		MemberVO memberVO = service.memberLogin(loginVO);
		boolean passMatch = passEncoder.matches(loginVO.getMEMBER_PWD(), memberVO.getMEMBER_PWD());
		
		if(memberVO == null || !passMatch) {
			return;
		}
		
		model.addAttribute("member", memberVO);
		
		if(loginVO.isUseCookie()) {
			int amount = 60 * 60 * 24 * 7;
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * amount));
			service.keepLogin(memberVO.getMEMBER_ID(), httpSession.getId(), sessionLimit);
		}
	}
	
	// 로그아웃 처리
	@GetMapping("/MemberLogout")
	public String logout(HttpServletRequest request,
						 HttpServletResponse response,
						 HttpSession httpSession) throws Exception {
		
		Object object = httpSession.getAttribute("login");
		if (object != null) {
			MemberVO membervo = (MemberVO) object;
			httpSession.removeAttribute("login");
			httpSession.invalidate();
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if (loginCookie != null) {
				loginCookie.setPath("/");
                loginCookie.setMaxAge(0);
                response.addCookie(loginCookie);
                service.keepLogin(membervo.getMEMBER_ID(), "none", new Date());
			}
		}
		return "/member/MemberLogout";
	}
}
