package com.comic.controller;


import java.util.List;
import java.util.Map;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.comic.service.SalesStatisticsService;

import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/salesstatistics/")
@AllArgsConstructor
public class SalesStatisticsController {
	
	private SalesStatisticsService statisticsService;
	
	@GetMapping("salesstatisticslist")
	public String statisticsView() { // 매출 통계 페이지
		return "salesstatistics/statisticslist";
	}
	
	@GetMapping("getYearlist")
	public ResponseEntity<Map<String, List<String>>> statisticsYearShow(@RequestParam("year") String year){ //월 차트 데이터
		return new ResponseEntity<Map<String, List<String>>>(statisticsService.chartMonthData(year), HttpStatus.OK);
	}
	
	@GetMapping("getMonthlist")
	public ResponseEntity<Map<String, List<String>>> statisticsMonthShow(@RequestParam("year") String year, @RequestParam("month") String month){ //일 차트 데이터
		return new ResponseEntity<Map<String, List<String>>>(statisticsService.chartDayData(year, month), HttpStatus.OK);
	}
	
	@GetMapping("getProductlist")
	public ResponseEntity<Map<String,String>> statisticsProductShow() {
		return new ResponseEntity<Map<String, String>>(statisticsService.chartProduct(), HttpStatus.OK);
	}
	
	@GetMapping("getRoomlist")
	public ResponseEntity<Map<String,String>> statisticsRoomShow() {
		return new ResponseEntity<Map<String, String>>(statisticsService.chartRoom(), HttpStatus.OK);
	}
}
