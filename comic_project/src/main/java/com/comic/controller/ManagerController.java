package com.comic.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

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

	@RequestMapping(value = { "/managerpos", "/Managerpos" }, method = RequestMethod.GET)
	public String younghakpos(Locale locale, Model model) {
		// logger.info("Welcome home! The client locale is {}.", locale);

		// Date date = new Date();
		// DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG,
		// DateFormat.LONG, locale);

		// String formattedDate = dateFormat.format(date);

		// model.addAttribute("serverTime", formattedDate );

		return "/younghak/Managerpos";
	}


	@GetMapping("importdetail")
	public String younghakimportdetail(Model model) {
		return "/younghak/importdetail";
	}

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String younghakworklogin(Model model) {
		
		return "younghak/login";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "room_start", method = { RequestMethod.GET, RequestMethod.POST })
	public void test(@RequestBody HashMap<String, Object> map// 배열 받기 traditional: true
	) {
		
		JSONArray jsonArray = new JSONArray(); // object 타입
		for (int i = 0; i < 5; i++) {
			String tmp = jsonArray.fromObject(map.get("list")).get(i).toString();
			System.out.println(tmp);
		}
		
		try {
			System.out.println("데이터가 들어옴!");

		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
