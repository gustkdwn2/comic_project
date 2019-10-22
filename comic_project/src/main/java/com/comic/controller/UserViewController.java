package com.comic.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.comic.model.UserBillVO;
import com.comic.model.UserProductBillVO;
import com.comic.service.UserOrderManegerService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/userView/")
@AllArgsConstructor
public class UserViewController {
	
	private UserOrderManegerService userOrderManegerService;
	
	@PostMapping("/main")
	public void mainView() {
		
	}
	
	@GetMapping("/main")
	public void main() {
		
	}
	
	@GetMapping("/order")
	public void orderView(Model model, final HttpSession session) {
		model.addAttribute("roomNum", session.getAttribute("roomNum"));
		model.addAttribute("OrderViewVO_List", userOrderManegerService.readCategory());
	}
	
	@GetMapping("/chatting")
	public void chat(final HttpSession session, Model model) {
		System.out.println(session.getAttribute("roomNum"));
		model.addAttribute("roomNum", session.getAttribute("roomNum"));
	}
	
	@GetMapping("userBill")
	public @ResponseBody UserBillVO userBill(@RequestParam("userId") String id) {
		return userOrderManegerService.userBill(id);
	}
	
	@GetMapping("userProductBill")
	public @ResponseBody List<UserProductBillVO> userProductBill(@RequestParam("userId") String id) {
		System.out.println(userOrderManegerService.userProductBill(id));
		return userOrderManegerService.userProductBill(id);
	}
	
	@GetMapping("/success")
	public void success() {
		
	}
	
}
