package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.model.ProductOrderVO;
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
	
	@GetMapping("/productOrderGet")
	public void productOrderGet(@RequestParam("productOrder_num") int productOrder_num, Model model) {
		model.addAttribute("productOrder", service.productOrderGet(productOrder_num));
	}
	
	@PostMapping("/productOrderRemove")
	public String productOrderRemove(@RequestParam("removeBtn") int productOrder_num) {
		service.productOrderRemove(productOrder_num);
		return "redirect:/productOrder/productOrderList";
	}
	
	@PostMapping("/productOrderRegister")
	public String productOrderRegister(ProductOrderVO vo) {
		service.productOrderRegister(vo);
		return "redirect:/productOrder/productOrderList";
	}
	
	@PostMapping("/productOrderModify")
	public String productOrderModify(ProductOrderVO vo) {
		service.productOrderModify(vo);
		return "redirect:/productOrder/productOrderList";
	}
	
	@PostMapping("/productOrderCheck")
	public String productOrderCheck(@RequestParam("checkBtn") int productOrder_num) {
		System.out.println(productOrder_num);
		service.productOrderCheck(productOrder_num);
		return "redirect:/productOrder/productOrderList";
	}
	
}
