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

import com.comic.model.LossVO;
import com.comic.model.ProductVO;
import com.comic.service.SettlementService;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;

import lombok.AllArgsConstructor;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("/settlement/")
@AllArgsConstructor
public class SettlementController {

	private SettlementService settleService;

	@GetMapping("/list.co")
	public void settlementList(Model model) {
		model.addAttribute("settleList", settleService.settlementList());
	}

	@ResponseBody  // map으로 리턴하기 위해
	@PostMapping("/list.co")
	public Map<String, Object> settlementCheck(@RequestBody HashMap<String, Object> map)
			throws JsonParseException, JsonMappingException, IOException {
		List<ProductVO> current = settleService.settlementList(); // 현재 재고
		Map<String, Object> errorMap = settleService.settlementError(map, current);

		return errorMap;
	}

	@PostMapping("modify.co")
	public String modify(RedirectAttributes rttr, @RequestParam("numList") String[] numList,
			@RequestParam("productList") String[] productList) {
		
		List<ProductVO> current = settleService.settlementList(); // 현재 재고 가져오기위해
		
		for (int i = 0; i < numList.length; i++) {
			
			System.out.println("현재재고 :" + current.get(i).getProduct_qty());
			System.out.println("입력재고 :" + productList[i]);
			
			settleService.modify(numList[i],productList[i]);
			settleService.insertLoss(current.get(i),productList[i]  ); // 손실테이블에 추가 필요
		}
		
		//rttr 사용으로 모달로 재고 변경알림 할 예정
		
		return "redirect:/settlement/list.co";
	}
}
