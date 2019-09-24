package com.comic.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;

/**
 * Handles requests for the application home page.
 */

  @Controller
  @RequestMapping("/managerpos/")
  public class ManagerController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
//	@RequestMapping(value = "index.co", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//		logger.info("Welcome home! The client locale is {}.", locale);
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "index";
//	}
	/* @GetMapping("/managerpos.co") */
	@RequestMapping(value = {"/managerpos.co","/Managerpos.co"}, method = RequestMethod.GET)
	public String younghakpos(Locale locale, Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		//String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "/younghak/Managerpos";
	}
	
	//@RequestMapping(value = "importdetail.co", method = RequestMethod.GET)
	@GetMapping("importdetail.co")
	public String younghakimportdetail( Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		//String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "/younghak/importdetail";
	}
	
	@RequestMapping(value = "login.co", method = RequestMethod.GET)
	public String younghakworklogin( Model model) {
		//logger.info("Welcome home! The client locale is {}.", locale);
		
		//Date date = new Date();
		//DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		//String formattedDate = dateFormat.format(date);
		
		//model.addAttribute("serverTime", formattedDate );
		
		return "younghak/login";
	}
//	
//	@RequestMapping(value = "/main", method = RequestMethod.GET)
//	public String mainView(Model model) {
//		return "sangju/main";
//	}
//	
//	@RequestMapping(value = "/order", method = RequestMethod.GET)
//	public String mainOrder(Model model) {
//		return "sangju/order";
//	}
	
}
