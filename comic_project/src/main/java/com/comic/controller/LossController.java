package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comic.service.LossService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/loss")
@AllArgsConstructor
public class LossController {
	
	private LossService lossService;
	
	@GetMapping("list.co")
	public  void lossList(Model model) {
		model.addAttribute("lossList", lossService.lossList()); // 손실테이블
	}
}
