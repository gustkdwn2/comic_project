package com.comic.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.model.BookVO;
import com.comic.service.BookService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/book")
@AllArgsConstructor
public class BookController {
	
	private BookService service;
	
	@GetMapping("/bookList")
	public void bookGetList(Model model) {
		model.addAttribute("bookList", service.bookGetList());
	}
	
	@GetMapping("/bookGet")
	public void bookGet(@RequestParam("book_name") String book_name, Model model) {
		model.addAttribute("book", service.bookGet(book_name));
	}
	
	@GetMapping("/bookRegister")
	public void bookRegister() {
		
	}
	
	@PostMapping("/bookRegister")
	public String bookRegister(BookVO vo) {
		service.bookRegister(vo);;
		return "redirect:/book/bookList";
	}
	
	@PostMapping("/bookModify")
	public String bookModify(BookVO vo, RedirectAttributes rttr) {
		if(service.bookModify(vo)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/book/bookList";
	}
	
	@PostMapping("/bookRemove")
	public String bookRemove(@RequestParam("book_name") String book_name, RedirectAttributes rttr) {
		if(service.bookRemove(book_name)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/book/bookList";
	}
	
}
