package com.comic.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comic.model.ChatVO;
import com.comic.service.ChattingService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/chat/")
@AllArgsConstructor
public class ChatController {
	
	private ChattingService chatService;
	
	@GetMapping("chatting")
	public void chat(HttpSession session, Model model,@RequestParam("room") String room) {
		model.addAttribute("admin", session.getAttribute("admin"));
		model.addAttribute("roomNum", room);
		
		List<ChatVO> chatList= chatService.selectChat(Integer.parseInt(room));
		model.addAttribute("chatList", chatList);
	}

}
