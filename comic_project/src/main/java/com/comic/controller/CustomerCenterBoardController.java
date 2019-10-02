package com.comic.controller;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.model.CustomerBoardVO;
import com.comic.model.CustomerCenterCriteriaVO;
import com.comic.model.CustomerCenterPageVO;
import com.comic.service.CustomerCenterService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/CustomerCenter/*")
public class CustomerCenterBoardController {
	
	private CustomerCenterService service;
	
	@GetMapping("/boardList")
	public void CustomerCenterList(CustomerCenterCriteriaVO cri, Model model) {
		
		log.info("\r\n####list : "+cri);
		model.addAttribute("list", service.getList(cri));
		
		int total = service.getTotal(cri);
		log.info("\r\n####total : "+total);
		model.addAttribute("count", service.getTotal(cri));
		model.addAttribute("pageMaker", new CustomerCenterPageVO(cri, total));
		
		
	}
	
	@GetMapping("/boardRegister")
	public void register(){
		
	}
	
	@PostMapping("/boardRegister")
	public String register(CustomerBoardVO board, RedirectAttributes rttr) {
		
		log.info("\r\n####register : "+board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBOARD_NUM());
		
		return "redirect:/CustomerCenter/boardList";
		
	}
	
	@GetMapping({"/boardGet","/boardModify"})
	public void get(@RequestParam("BOARD_NUM") Long BOARD_NUM,
			@ModelAttribute("cri") CustomerCenterCriteriaVO cri, Model model) {
		
		log.info("\r\n####get or modify : "+model);
		
		model.addAttribute("board", service.get(BOARD_NUM));
	}
	
	@PostMapping("/boardModify")
	public String modify(CustomerBoardVO board, CustomerCenterCriteriaVO cri, RedirectAttributes rttr) {
		
		log.info("\r\n####modify : "+board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "sucess");
		}
		return "redirect:/CustomerCenter/boardList"+cri.getListLink(); 
		
	}
	
	@PostMapping("/boardRemove")
	public String remove(@RequestParam("BOARD_NUM") Long BOARD_NUM, CustomerCenterCriteriaVO cri, RedirectAttributes rttr) {
		
		log.info("\r\n####remove board_num : "+BOARD_NUM);
		
			if(service.remove(BOARD_NUM)) {
				rttr.addFlashAttribute("result", "성공");
			}
		return "redirect:/CustomerCenter/boardList"+cri.getListLink(); 
		
	}
}