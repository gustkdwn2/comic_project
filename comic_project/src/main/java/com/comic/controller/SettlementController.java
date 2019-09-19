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

	@ResponseBody
	@PostMapping("/list.co")
	public Map<String, Object> settlementCheck(@RequestBody HashMap<String, Object> map)
			throws JsonParseException, JsonMappingException, IOException {
		List<ProductVO> current = settleService.settlementList(); // int 타입
		JSONArray jsonArray = new JSONArray(); // object 타입
		int[] list = new int[current.size()];
		for (int i = 0; i < list.length; i++) { // object type을 int형으로 저장
			list[i] = Integer.parseInt(jsonArray.fromObject(map.get("list")).get(i).toString());
		}

		for (int i = 0; i < current.size(); i++) {
			if (current.get(i).getProduct_qty() > list[i]) { // 현재 재고 수량 > 입력한 실제수량 -> 오차수량은 -
				map.put(Integer.toString(i), ((-1) * (current.get(i).getProduct_qty() - list[i])));
			} else if (current.get(i).getProduct_qty() < list[i]) { // 현재 재고 수량 > 입력한 실제수량 -> 오차수량은 +
				map.put(Integer.toString(i), ((-1) * (current.get(i).getProduct_qty() - list[i])));
			} else {
				map.put(Integer.toString(i), 0);
			}
		}
		map.remove("list"); // 실제 수량 입력은 제거

		return map;
	}

	@PostMapping("modify.co")
	public String modify(RedirectAttributes rttr, @RequestParam("numList") String[] numList,
			@RequestParam("productList") String[] productList) {
		
		for (int i = 0; i < numList.length; i++) {
			settleService.modify(numList[i],productList[i]);
		}
		
		//rttr 할차례
		
		
		return "redirect:/settlement/list.co";
	}
}
