package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.service.ProductOrderService;
import com.comic.service.ProductService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/productOrder/")
@AllArgsConstructor
public class ProductOrderController {
	
	private ProductOrderService service;
	private ProductService productService;
	
	@GetMapping("/productOrderList")
	public void productOrderList(Model model) {
		model.addAttribute("productOrderList", service.productOrderList());
		model.addAttribute("productList", productService.productGetList());
	}
	
	@PostMapping("/productOrderRemove")
	public String productOrderRemove(@RequestParam("removeBtn") int productOrder_num, RedirectAttributes rttr) {
		service.productOrderRemove(productOrder_num);
		rttr.addFlashAttribute("result", "success");
		return "redirect:/productOrder/productOrderList";
	}
	
}
