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
@RequestMapping("/product/")
@AllArgsConstructor
public class ProductController {
	
	private ProductService service;
	
	@GetMapping("/productList")
	public void productGetList(Model model) {
		model.addAttribute("productList", service.productGetList());
	}
	
	@GetMapping("/productGet")
	public void productGet(@RequestParam("product_num") int product_num, Model model) {
		model.addAttribute("product", service.productGet(product_num));
	}
	
	@GetMapping("/productRegister")
	public void productRegister() {
		
	}
	
	@GetMapping("/productOrder")
	public void productOrder(Model model) {
		model.addAttribute("productList", service.productGetList());
	}
	
	@PostMapping("/productRegister")
	public String productRegister(ProductVO vo) {
		service.productRegister(vo);
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productModify")
	public String productModify(ProductVO vo, RedirectAttributes rttr) {
		if(service.productModify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productRemove")
	public String productRemove(@RequestParam("product_num") int product_num, RedirectAttributes rttr) {
		if(service.productRemove(product_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/product/productList";
	}
	
}
