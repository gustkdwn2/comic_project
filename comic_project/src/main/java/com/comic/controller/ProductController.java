package com.comic.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public void productGetList(Model model) {
		model.addAttribute("productList", service.productGetList());
	}
	
	@GetMapping("/productGet")
	public @ResponseBody ProductVO productGet(@RequestParam("product_num") int product_num) {
//		Map<String, ProductVO> map = new HashMap<String, ProductVO>();
		ProductVO vo = service.productGet(product_num);
//		map.put("productGet", service.productGet(product_num));
		return vo;
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
	public String productRemove(@RequestParam("removeBtn") int product_num, RedirectAttributes rttr) {
		service.productRemove(product_num);
		rttr.addFlashAttribute("result", "success"); 
		return "redirect:/product/productList";
	}
	
	@PostMapping("/productNameCheck")
	@ResponseBody
	public int productNameCheck(@RequestParam("product_name") String product_name) {
		int result = 0;
		ProductVO nameCheck = service.productNameCheck(product_name);
		if(nameCheck != null) {
			result = 1;
		}
		return result;
	}
	
}