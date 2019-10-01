package com.comic.service;

import java.util.List;
import java.util.Map;

public interface SalesStatisticsService {

	public Map<String, List<String>> chartMonthData(String year);
	
	public Map<String, List<String>> chartDayData(String year,String month);
}
