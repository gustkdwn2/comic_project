package com.comic.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.comic.service.ChatService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/chat/")
@AllArgsConstructor
@Log4j
public class ChatController {
	
	private ChatService chatService;
	
	@GetMapping("chatting")
	public void chat(final HttpSession session, Model model) {
		model.addAttribute("admin", session.getAttribute("admin"));
	}

}
