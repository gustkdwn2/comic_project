package com.comic.controller;

import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.comic.service.SalesStatisticsService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/salesstatistics/")
@AllArgsConstructor
public class SalesStatisticsController {
	
	private SalesStatisticsService statisticsService;
	
	@GetMapping("list")
	public String statisticsView() {
		return "salesstatistics/statisticslist";
	}
	
	@GetMapping("getlist")
	public ResponseEntity<Map<String, List<String>>> statisticsShow(ModelAndView mav){
		return new ResponseEntity<Map<String, List<String>>>(statisticsService.chartData(), HttpStatus.OK);
	}
}
