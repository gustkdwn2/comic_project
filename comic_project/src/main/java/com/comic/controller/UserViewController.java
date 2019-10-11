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
		session.setAttribute("roomNum", roomNum);
		model.addAttribute("roomNum", session.getAttribute("roomNum"));
	}
	
	@GetMapping("/order")
	public void orderView(Model model, final HttpSession session) {
		model.addAttribute("roomNum", session.getAttribute("roomNum"));
		model.addAttribute("OrderViewVO_List", userOrderManegerService.readCategory());
	}
	
	@GetMapping("/chatting")
	public ModelAndView chat(ModelAndView mv) {
		/*
		 * mv.setViewName("chat/chattingview");
		 * 
		 * User user = (User)
		 * SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 * System.out.println("user name: " + user.getUsername());
		 * System.out.println("normal chat page"); mv.addObject("userid",
		 * user.getUsername());
		 */
		
		return mv;
	} 
}
