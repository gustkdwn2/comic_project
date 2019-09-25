package com.comic.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comic.model.OrderProductViewVO;
import com.comic.model.OrderViewVO;
import com.comic.model.ProductVO;
import com.comic.service.OrderService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/sangju/")
@AllArgsConstructor
public class SangjuController {

	private OrderService orderService;

	@GetMapping("/main")
	public void mainView(Model model, @RequestParam("roomNum") int roomNum) {
		model.addAttribute("roomNum", roomNum);
	}

	@GetMapping("/admin")
	public void adminView(Model model) {
		model.addAttribute("OrderViewVO_List", orderService.readCategory());
	}

	@PostMapping("/admin/categoryAdd")
	public String categoryAdd(@RequestParam("category") String category) {
		System.out.println("categoryAdd....category " + category);

		OrderViewVO vo = new OrderViewVO();
		vo.setOrderview_category(category);
		vo.setOrderview_product_num(0);
		orderService.registerCategory(vo);

		return "redirect:/sangju/admin";
	}

	@PostMapping("/admin/categoryUpdate")
	public String categoryUpdate(@RequestParam("category") String category, @RequestParam("number") int number) {
		System.out.println("categoryUpdate....category " + category);
		System.out.println("categoryUpdate....number " + number);

		OrderViewVO vo = new OrderViewVO();
		vo.setOrderview_num(number);
		vo.setOrderview_category(category);
		vo.setOrderview_product_num(0);

		orderService.updateCategory(vo);

		return "redirect:/sangju/admin";
	}

	@PostMapping("/admin/categoryDelete")
	public String categoryDelete(@RequestParam("number") int number) {
		System.out.println("categoryDelete....number " + number);

		orderService.deleteCategory(number);

		return "redirect:/sangju/admin";
	}

	@GetMapping("/order")
	public void orderView(Model model, @RequestParam("roomNum") int roomNum) {

	}

	@GetMapping("/start")
	public void startView() {

	}

	// ajax
	@GetMapping(value = "/productRead/{category}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<ProductVO>> getAjaxList(@PathVariable("category") String category) {
		System.out.println("getAjaxList....");
		return new ResponseEntity<List<ProductVO>>(orderService.readProduct(category), HttpStatus.OK);
	}
	
	@PostMapping(value = "/productCheck", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> productCheck(@RequestBody Map<String, String> productName) {
		System.out.println("productCheck...." + productName);
		int result = orderService.productCheck(productName.get("productName"));
		return result >= 1 ? new ResponseEntity<String>("OK", HttpStatus.OK)
				: new ResponseEntity<String>("NULL", HttpStatus.OK);
	}
	
	@PostMapping(value = "/productAdd", consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> productAdd(@RequestBody Map<String, String> productName) {
		System.out.println("productAdd...." + productName);
		System.out.println("productAdd...." + productName.get("productName"));
		System.out.println("productAdd...." + productName.get("productCategory"));
		orderService.productInsert(productName.get("productName"), productName.get("productCategory"));
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}

}
