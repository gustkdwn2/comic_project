package com.comic.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comic.service.ChatService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/chat/")
@AllArgsConstructor
public class ChatController {
	
	//private ChatService chatService;
	
	@GetMapping("chatting")
	public void chat(final HttpSession session, Model model, HttpServletRequest req) {
		model.addAttribute("admin", session.getAttribute("admin"));
	}

}
