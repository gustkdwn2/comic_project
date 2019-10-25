package com.comic.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.comic.model.ChatVO;
import com.comic.service.ChattingService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/chat/")
@AllArgsConstructor
@Log4j
public class ChatController {
	
	private ChattingService chatService;
	
	@GetMapping("chatting")
	public @ResponseBody List<ChatVO> chat(HttpSession session, Model model,@RequestParam("room") String room) {
		model.addAttribute("admin", session.getAttribute("admin"));
		
		List<ChatVO> chatList= chatService.selectChat(Integer.parseInt(room));
		return chatList;
	}
	


}
