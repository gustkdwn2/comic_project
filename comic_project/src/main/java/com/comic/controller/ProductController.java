package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.comic.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/stock/")
@AllArgsConstructor
public class ProductController {
	
	private ProductService service;
	
	@GetMapping("/productList.co")
	public void productGetList(Model model) {
		model.addAttribute("productList", service.productGetList());
	}
	
	
	
}
