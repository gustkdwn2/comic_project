package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comic.model.LossVO;
import com.comic.service.LossService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/loss")
@AllArgsConstructor
public class LossController {
	
	private LossService lossService;
	
	@GetMapping("losslist")
	public void lossList(Model model) {
		model.addAttribute("lossList", lossService.lossList()); // 손실테이블
	}
	
	@PostMapping("lossRegister")
	public String lossRegister(LossVO vo) {
		lossService.lossRegister(vo);
		return "redirect:/loss/losslist";
	}
}
