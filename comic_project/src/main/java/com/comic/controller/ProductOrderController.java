package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comic.service.ProductOrderService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/productOrder/")
@AllArgsConstructor
public class ProductOrderController {
	
	private ProductOrderService service;
	
	@GetMapping("/productOrderList")
	public void productOrderList(Model model) {
		model.addAttribute("productOrderList", service.productOrderList());
	}
	
}
