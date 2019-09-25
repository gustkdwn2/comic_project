package com.comic.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.comic.model.ProductVO;
import com.comic.service.SettlementService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/settlement")
@AllArgsConstructor
public class SettlementController {

	private SettlementService settleService;

	@GetMapping("/list")
	public void settlementList(Model model) {
		model.addAttribute("settleList", settleService.settlementList()); // 재고테이블
	}

	@ResponseBody  // map으로 리턴하기 위해
	@PostMapping("/list")
	public Map<String, Object> settlementCheck(@RequestBody HashMap<String, Object> map)
			throws JsonParseException, JsonMappingException, IOException {
		List<ProductVO> current = settleService.settlementList(); // 현재 재고
		Map<String, Object> errorMap = settleService.settlementError(map, current); // 오차 재고

		return errorMap;
	}

	@PostMapping("/modify")
	public String modify(@RequestParam("numList") String[] numList,
			@RequestParam("productList") String[] productList) {
		
		List<ProductVO> current = settleService.settlementList(); // 현재 재고 가져옴
		
		for (int i = 0; i < numList.length; i++) {
			settleService.modify(numList[i],productList[i]); // 재고 테이블 수정
			settleService.insertLoss(current.get(i),productList[i]); // 손실테이블에 추가 (현재재고와 입력 재고값 보냄)
		}
		
		return "redirect:/settlement/list";
	}
}
