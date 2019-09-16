package com.comic.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comic.service.SettlementService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/settlement/")
@AllArgsConstructor
public class SettlementController {

	private SettlementService settleService;

	@GetMapping("/list.co")
	public void settlementList(Model model) {
		model.addAttribute("settleList", settleService.settlementList());
	}
}
