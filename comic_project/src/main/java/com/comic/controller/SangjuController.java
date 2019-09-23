package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comic.model.OrderViewVO;
import com.comic.service.OrderService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/sangju/")
@AllArgsConstructor
public class SangjuController {

	OrderService oderService;
	
	@GetMapping("/main")
	public void mainView(Model model, @RequestParam("roomNum") int roomNum) {
		model.addAttribute("roomNum", roomNum);
	}

	@GetMapping("/admin")
	public void adminView() {
		
	}
	
	@PostMapping("/admin/categoryAdd")
	public String categoryAdd(@RequestParam("category") String category) {
		System.out.println("categoryAdd...." + category);

		OrderViewVO vo = new OrderViewVO();
		vo.setOrderview_category(category);
		vo.setOrderview_product_num(0);
		oderService.registerCategory(vo);
		
		return "redirect:/sangju/admin";
	}
	
	@GetMapping("/order")
	public void orderView(Model model, @RequestParam("roomNum") int roomNum)	{
		
	}
	
	@GetMapping("/start")
	public void startView()	{
		
	}

}
