package com.comic.controller;

import org.springframework.security.access.prepost.PostAuthorize;
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
@RequestMapping("/product")
@AllArgsConstructor
public class ProductController {
	
	private ProductService service;
	
	@GetMapping("/productList")
	@PostAuthorize("permitAll()")
	public void productGetList(Model model) {
		model.addAttribute("productList", service.productGetList());
	}
	
	@GetMapping("/productGet")
	@PostAuthorize("permitAll()")
	public void productGet(@RequestParam("product_num") int product_num, Model model) {
		model.addAttribute("product", service.productGet(product_num));
	}
	
	@GetMapping("/productRegister")
	@PostAuthorize("permitAll()")
	public void productRegister() {
		
	}
	
	@GetMapping("/productOrder")
	@PostAuthorize("permitAll()")
	public void productOrder(Model model) {
		model.addAttribute("productList", service.productGetList());
	}
	
	@PostMapping("/productRegister")
	@PostAuthorize("permitAll()")
	public String productRegister(ProductVO vo) {
		service.productRegister(vo);;
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productModify")
	@PostAuthorize("permitAll()")
	public String productModify(ProductVO vo, RedirectAttributes rttr) {
		if(service.productModify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productRemove")
	@PostAuthorize("permitAll()")
	public String productRemove(@RequestParam("product_num") int product_num, RedirectAttributes rttr) {
		if(service.productRemove(product_num)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/product/productList";
	}
	
}
