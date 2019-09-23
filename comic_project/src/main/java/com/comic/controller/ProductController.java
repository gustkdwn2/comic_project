package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.model.ProductVO;
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
	
	@GetMapping({"/productGet.co", "/productModify.co"})
	public void productGet(@RequestParam("num") int num, Model model) {
		model.addAttribute("product", service.productGet(num));
	}
	
	@GetMapping("/productRegister.co")
	public void productRegister() {
		
	}
	
	@PostMapping("/productRegister.co")
	public String productRegister(ProductVO vo) {
		service.productRegister(vo);;
		return "redirect:/stock/productList.co";
	}
	
}
