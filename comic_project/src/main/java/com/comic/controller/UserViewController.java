package com.comic.controller;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.comic.service.UserOrderManegerService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/userView/")
@AllArgsConstructor
public class UserViewController {
	
	private UserOrderManegerService userOrderManegerService;
	
	@PostMapping("/main")
	public void mainView(@RequestParam("roomNum") int roomNum, final HttpSession session, Model model) {
		session.removeAttribute("roomNum");
		session.removeAttribute("admin");
		session.setAttribute("roomNum", roomNum);
		model.addAttribute("roomNum", session.getAttribute("roomNum"));
	}
	
	@GetMapping("/order")
	public void orderView(Model model, final HttpSession session) {
		model.addAttribute("roomNum", session.getAttribute("roomNum"));
		model.addAttribute("OrderViewVO_List", userOrderManegerService.readCategory());
	}
	
	@GetMapping("/chatting")
	public void chat(final HttpSession session, Model model) {
		System.out.println(session.getAttribute("roomNum"));
		model.addAttribute("roomNum", session.getAttribute("roomNum"));
	} 
}
