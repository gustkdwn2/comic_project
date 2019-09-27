package com.comic.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.comic.mapper.SalesStatisticsMapper;
import com.comic.model.SalesStatisticsVO;
import com.comic.service.SalesStatisticsService;

import lombok.Setter;

@Service
public class SalesStatisticsServiceImpl implements SalesStatisticsService {
	
	@Setter(onMethod_ = @Autowired)
	private SalesStatisticsMapper statisticsMapper;
	
	@Override
	public Map<String, List<String>> chartData() {
		Map<String, List<String>> map = statistics(statisticsMapper.productsalesData(),statisticsMapper.roomsalesData());
		return map;
	}

	private Map<String, List<String>> statistics(List<SalesStatisticsVO> productsalesData,
			List<SalesStatisticsVO> roomsalesData) { // 상품, 방 매출 데이터
		Map<String, List<String>> map = new HashMap<String, List<String>>();
		String pattern = "yyyy-M-dd";
		SimpleDateFormat simpleDataFormat = new SimpleDateFormat(pattern);
		List<String> monthList = monthLabel(); 
		List<String> dayList = dayLabel();
		List<String> monthprice = 
				monthtotal(monthList,simpleDataFormat,productsalesData,roomsalesData); // 1월부터 순차적으로 값 저장.. 리스트로
		List<String> dayprice = daytotal(dayList,monthprice);// 해당 월의 일별 매출액
		
		map.put("month", monthList); // 월 차트 라벨(1~12)
		map.put("day", dayList); // 일 차트 라벨(1~31)
		map.put("monthprice", monthprice); // 월별 매출액
		
			
		return map;
	}
	
	private List<String> daytotal(List<String> dayList, List<String> monthprice) {
		String result = null;
		
		List<String> dayPrice = new ArrayList<String>();
		
		System.out.println(monthprice.get(8)); // x월 체크하기위해..
		// 해당 몇월 몇일에 대한 total 매출액이 필요 --> mapper
		
		
		
		
		
		return dayPrice;
	}

	private List<String> monthtotal(List<String> monthList,SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> productsalesData, List<SalesStatisticsVO> roomsalesData) { // x월 전체 매출액
		String result = null;
		
		List<String> monthPrice = new ArrayList<String>();
		for (int i = 0; i < monthList.size(); i++) {
			int productTotal = monthproductTotalPrice(Integer.toString((i+1)), simpleDataFormat, productsalesData);
			int roomTotal = monthroomTotalPrice(Integer.toString((i+1)), simpleDataFormat, roomsalesData);
			result = Integer.toString(productTotal+roomTotal);
			monthPrice.add(result);
		}
		
		return monthPrice;
	}
	
	private int monthroomTotalPrice(String month, SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> roomsalesData) { // 월 룸 매출액
		
			int total = 0;
		
		for (int i = 0; i < roomsalesData.size(); i++) {
			if(simpleDataFormat.format(roomsalesData.get(i).getRoomsales_time()).split("-")[1].equals(month)) { //.substring(5, 7) 월 ex) 09
				total += roomsalesData.get(i).getRoomsales_totalprice(); // total에 x월 룸 매출 금액 저장
			} 
		}
		return total;
	}

	private int monthproductTotalPrice(String month, SimpleDateFormat simpleDataFormat,
			List<SalesStatisticsVO> productsalesData) { //월 상품 매출액
		int total = 0;
		
		for (int i = 0; i < productsalesData.size(); i++) {
			if(simpleDataFormat.format(productsalesData.get(i).getProductsales_time()).split("-")[1].equals(month)) { //.substring(5, 7) 월 ex) 9
				total += productsalesData.get(i).getProductsales_order_price();// total에 x월 상품판매 금액 저장
			} 
		}
		return total;
	}
	
	private List<String> dayLabel() { // 차트 일 라벨
		List<String> dayList = new ArrayList<String>();
		for (int i = 0; i < 31; i++) {
			dayList.add(Integer.toString(i+1));
		}
		return dayList;
	}

	private List<String> monthLabel() { // 차트 월 라벨
		List<String> monthList = new ArrayList<String>();
		for (int i = 0; i < 12; i++) {
			monthList.add(Integer.toString(i+1));
		}
		return monthList;
	}

}
